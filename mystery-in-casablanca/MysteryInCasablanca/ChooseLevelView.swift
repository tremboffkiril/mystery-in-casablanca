import SwiftUI

struct ChooseLevelView: View {
    @FetchRequest(sortDescriptors: []) var mystery: FetchedResults<Mystery>
    @Environment(\.managedObjectContext) var viewContext
    @State private var presentMysteryInCasablanca = false
    @State var isCreate = true
    @State var currentLevel = "easy"
    
    var body: some View {
        NavigationView {
            ZStack {
                bgColor.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Choose your level")
                            .font(MysteryInCasablancaFont.regular.font(with: 34))
                            .foregroundColor(textColor)
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
                                ZStack {
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width / 2.1, height: 30)
                                        .foregroundColor(actionColor.opacity(currentLevel == "easy" ? 0.3 : 0))
                                    Text(" Easy ")
                                        .font(MysteryInCasablancaFont.regular.font(with: 20))
                                        .foregroundColor(goldColor)
                                }
                            }
                        }
                        
                        Button {
                            setMastery(mastery: "medium")
                        } label: {
                            VStack {
                                Image("medium")
                                    .resizable()
                                    .cornerRadius(10)
                                ZStack {
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width / 2.1, height: 30)
                                        .foregroundColor(actionColor.opacity(currentLevel == "medium" ? 0.3 : 0))
                                    Text(" Medium ")
                                        .font(MysteryInCasablancaFont.regular.font(with: 20))
                                        .foregroundColor(goldColor)
                                }
                                
                            }
                        }
                        
                        Button {
                            setMastery(mastery: "hard")
                        } label: {
                            VStack {
                                Image("hard")
                                    .resizable()
                                    .cornerRadius(10)
                                ZStack {
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width / 2.1, height: 30)
                                        .foregroundColor(actionColor.opacity(currentLevel == "hard" ? 0.3 : 0))
                                    Text(" Hard ")
                                        .font(MysteryInCasablancaFont.regular.font(with: 20))
                                        .foregroundColor(goldColor)
                                }
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .frame(width: UIScreen.main.bounds.width / 2.1)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, isCreate ? .zero : 70)
            }
        }
        .fullScreenCover(isPresented: $presentMysteryInCasablanca) {
            MysteryInCasablancaTabBarView()
                .onAppear {
                    MysteryInCasablancaMusicService.shared.updatePlayer(setOn: (mystery.first?.isSoundEnable ?? true))
                }
        }
        .onAppear {
            currentLevel = mystery.first?.level ?? ""
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: MysteryInCasablancaBackButton())
    }
    
    func setMastery(mastery: String) {
        mystery.first?.level = mastery
        currentLevel = mastery
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
    ChooseLevelView()
}
