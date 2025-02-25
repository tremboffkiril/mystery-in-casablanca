
import SwiftUI

struct MysteryInCasablancaPlay: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var mystery: FetchedResults<Mystery>
    @Environment(\.presentationMode) private var present
    @State var mysteryQuiz = casablancaQuiz
    @State var mysteryInCasablancaIndexQuestion = 0
    @State var sticksWoned = 0
    @State var presentMysteryInCasablancaEndPlay = false
    
    @State var mysteryInCasablancaTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var mysteryInCasablancaDesiredDurationDate: Date = Calendar.current.date(byAdding: .second,
                                                                       value: 90,
                                                                       to: Date())!
    @State var mysteryInCasablancaCurrentDate = Date()
    @State var mysteryInCasablancaDuration = "00:00"
    
    static var timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text(mysteryInCasablancaDuration)
                        .font(MysteryInCasablancaFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                        .onReceive(mysteryInCasablancaTimer) { _ in
                            var distanceTime = mysteryInCasablancaDesiredDurationDate.timeIntervalSince(Date())
                            if distanceTime <= 0 {
                                distanceTime = .zero
                                mysteryInCasablancaDuration = "00:00"
                                mysteryInCasablancaTimer.upstream.connect().cancel()
                                collectStickItem()
                            }
                            mysteryInCasablancaDuration = MysteryInCasablancaPlay.timeFormatter.string(from: distanceTime) ?? "00:00"
                        }
                    Spacer()
                    Text("\(mysteryInCasablancaIndexQuestion + 1) / \(mysteryQuiz.count)")
                        .font(MysteryInCasablancaFont.medium.font(with: 32))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    Spacer()
                    HStack {
                        Text("\(sticksWoned)")
                            .font(MysteryInCasablancaFont.regular.font(with: 34))
                            .foregroundColor(textColor)
                        Image("stickShop")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(10)
                    }
                }
                Text(mysteryQuiz[mysteryInCasablancaIndexQuestion].question)
                    .font(MysteryInCasablancaFont.medium.font(with: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Image(mystery.first?.level ?? "easy")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(Array(mysteryQuiz[mysteryInCasablancaIndexQuestion].answers.enumerated()), id: \.offset) { index, answer in
                            Button {
                                checkMysteryInCasablancaAnswer(with: index)
                            } label: {
                                MysteryInCasablancaButtonStack(buttonText: answer.text)
                            }
                        }
                    }
                }
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    MysteryInCasablancaButtonStack(buttonText: "Close")
                }
            }
            .padding()
        }
        .onAppear {
            if mystery.first?.level == "easy" {
                mysteryQuiz = casablancaQuiz
                mysteryInCasablancaDesiredDurationDate = Calendar.current.date(byAdding: .second,
                                                                value: 180,
                                                                to: Date())!
            } else if mystery.first?.level == "medium" {
                mysteryQuiz = casablancaMediumQuiz
                mysteryInCasablancaDesiredDurationDate = Calendar.current.date(byAdding: .second,
                                                                value: 90,
                                                                to: Date())!
            } else if mystery.first?.level == "hard" {
                mysteryQuiz = casablancaHardQuiz
                mysteryInCasablancaDesiredDurationDate = Calendar.current.date(byAdding: .second,
                                                                value: 60,
                                                                to: Date())!
            }
        }
        .fullScreenCover(isPresented: $presentMysteryInCasablancaEndPlay) {
            MysteryInCasablancaPlayFinish(sticksWoned: sticksWoned)
        }
    }
    
    func collectStickItem() {
        let sticks = mystery.first?.hooks ?? .zero
        mystery.first?.hooks = sticks + Int16(sticksWoned)
        do {
            try viewContext.save()
            presentMysteryInCasablancaEndPlay = true
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func checkMysteryInCasablancaAnswer(with index: Int) {
        if mysteryQuiz[mysteryInCasablancaIndexQuestion].answers[index].isCorrect {
            sticksWoned += 20
        } else if sticksWoned >= 20 {
            sticksWoned -= 15
        }
        if mysteryInCasablancaIndexQuestion < mysteryQuiz.count - 1 {
            mysteryInCasablancaIndexQuestion += 1
        } else {
            collectStickItem()
        }
    }
}

#Preview {
    MysteryInCasablancaPlay()
}
