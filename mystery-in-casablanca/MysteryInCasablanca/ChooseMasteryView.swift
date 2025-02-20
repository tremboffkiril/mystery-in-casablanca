import SwiftUI

struct ChooseMasteryView: View {
    @FetchRequest(sortDescriptors: []) var fishermen: FetchedResults<Fisherman>
    @Environment(\.managedObjectContext) var viewContext
    @State private var presentMysteryInCasablanca = false
    @State var isCreate = true
    
    var body: some View {
        NavigationView {
            ZStack {
                bgColor.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Choose Bass Mastery")
                            .font(BassFont.regular.font(with: 34))
                            .foregroundColor(textColor)
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Button {
                            setMastery(mastery: "easy")
                        } label: {
                            VStack {
                                Image("easy")
                                    .resizable()
                                    .cornerRadius(10)
                                Text("Easy")
                                    .font(BassFont.regular.font(with: 20))
                                    .foregroundColor(actionColor)
                            }
                        }
                        
                        Button {
                            setMastery(mastery: "medium")
                        } label: {
                            VStack {
                                Image("medium")
                                    .resizable()
                                    .cornerRadius(10)
                                Text("Medium")
                                    .font(BassFont.regular.font(with: 20))
                                    .foregroundColor(actionColor)
                            }
                        }
                        
                        Button {
                            setMastery(mastery: "hard")
                        } label: {
                            VStack {
                                Image("hard")
                                    .resizable()
                                    .cornerRadius(10)
                                Text("Hard")
                                    .font(BassFont.regular.font(with: 20))
                                    .foregroundColor(actionColor)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .frame(width: UIScreen.main.bounds.width / 2.3)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, isCreate ? .zero : 70)
            }
        }
        .fullScreenCover(isPresented: $presentMysteryInCasablanca) {
            MysteryInCasablancaTabBarView()
                .onAppear {
                    BassMusicService.shared.updatePlayer(setOn: (fishermen.first?.isSoundEnable ?? true))
                }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BassBackButton())
    }
    
    func setMastery(mastery: String) {
        fishermen.first?.mastery = mastery
        do {
            try viewContext.save()
            if isCreate {
                presentMysteryInCasablanca.toggle()
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    ChooseMasteryView()
}
