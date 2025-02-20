
import SwiftUI

struct MysteryInCasablancaPlay: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var fishermen: FetchedResults<Fisherman>
    @Environment(\.presentationMode) private var present
    @State var fishingQuiz = fishingQuizArray
    @State var mysteryInCasablancaIndexQuestion = 0
    @State var fishingRodsWoned = 0
    @State var presentBassEndPlay = false
    
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
                        .font(BassFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                        .onReceive(mysteryInCasablancaTimer) { _ in
                            var distanceTime = mysteryInCasablancaDesiredDurationDate.timeIntervalSince(Date())
                            if distanceTime <= 0 {
                                distanceTime = .zero
                                mysteryInCasablancaDuration = "00:00"
                                mysteryInCasablancaTimer.upstream.connect().cancel()
                                collectFishingRods()
                            }
                            mysteryInCasablancaDuration = MysteryInCasablancaPlay.timeFormatter.string(from: distanceTime) ?? "00:00"
                        }
                    Spacer()
                    Text("\(mysteryInCasablancaIndexQuestion + 1) / \(fishingQuiz.count)")
                        .font(BassFont.medium.font(with: 32))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    Spacer()
                    HStack {
                        Text("\(fishingRodsWoned)")
                            .font(BassFont.regular.font(with: 34))
                            .foregroundColor(textColor)
                        Image("fishingShop")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(10)
                    }
                }
                Text(fishingQuiz[mysteryInCasablancaIndexQuestion].question)
                    .font(BassFont.medium.font(with: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Image(fishermen.first?.mastery ?? "easy")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(Array(fishingQuiz[mysteryInCasablancaIndexQuestion].answers.enumerated()), id: \.offset) { index, answer in
                            Button {
                                checkBassAnswer(with: index)
                            } label: {
                                BassButtonStack(buttonText: answer.text)
                            }
                        }
                    }
                }
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    BassButtonStack(buttonText: "Close")
                }
            }
            .padding()
        }
        .onAppear {
            if fishermen.first?.mastery == "easy" {
                mysteryInCasablancaDesiredDurationDate = Calendar.current.date(byAdding: .second,
                                                                value: 180,
                                                                to: Date())!
            } else if fishermen.first?.mastery == "medium" {
                mysteryInCasablancaDesiredDurationDate = Calendar.current.date(byAdding: .second,
                                                                value: 90,
                                                                to: Date())!
            } else if fishermen.first?.mastery == "hard" {
                mysteryInCasablancaDesiredDurationDate = Calendar.current.date(byAdding: .second,
                                                                value: 60,
                                                                to: Date())!
            }
        }
        .fullScreenCover(isPresented: $presentBassEndPlay) {
            MysteryInCasablancaPlayFinish(fishingRodsWoned: fishingRodsWoned)
        }
    }
    
    func collectFishingRods() {
        let fishingRods = fishermen.first?.hooks ?? .zero
        fishermen.first?.hooks = fishingRods + Int16(fishingRodsWoned)
        do {
            try viewContext.save()
            presentBassEndPlay = true
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func checkBassAnswer(with index: Int) {
        if fishingQuiz[mysteryInCasablancaIndexQuestion].answers[index].isCorrect {
            fishingRodsWoned += 20
        } else if fishingRodsWoned >= 20 {
            fishingRodsWoned -= 15
        }
        if mysteryInCasablancaIndexQuestion < fishingQuiz.count - 1 {
            mysteryInCasablancaIndexQuestion += 1
        } else {
            collectFishingRods()
        }
    }
}

#Preview {
    MysteryInCasablancaPlay()
}
