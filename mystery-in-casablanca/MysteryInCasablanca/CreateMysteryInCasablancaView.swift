import SwiftUI

struct CreateBassView: View {
    @FetchRequest(sortDescriptors: []) var fishermen: FetchedResults<Fisherman>
    @Environment(\.managedObjectContext) var viewContext
    @State var mysteryInCasablancaFullName: String = String()
    @State private var presentAlert = false
    @State private var presentMysteryInCasablanca = false

    var body: some View {
        NavigationView {
            ZStack {
                bgColor.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Create your Bass")
                            .font(BassFont.regular.font(with: 34))
                            .foregroundColor(textColor)
                        Spacer()
                    }
                    
                    Spacer()
                    BassTexFieldStack(placeholderText: "Full name",
                                      input: $mysteryInCasablancaFullName)
                    
                    Spacer()
                    NavigationLink(destination: ChooseMasteryView()) {
                        BassButtonStack(buttonText: "Create Bass")
                    }.simultaneousGesture(TapGesture().onEnded {
                        createBass(isGuest: false)
                    })
                    
                    Button {
                        createBass(isGuest: true)
                    } label: {
                        BassButtonStack(buttonText: "Close creating")
                    }
                }
                .padding()
            }
        }
        .fullScreenCover(isPresented: $presentMysteryInCasablanca) {
            MysteryInCasablancaTabBarView()
                .onAppear {
                    BassMusicService.shared.updatePlayer(setOn: (fishermen.first?.isSoundEnable ?? true))
                }
        }
        .alert("Enter full name for continue", isPresented: $presentAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

extension CreateBassView {
    func createBass(isGuest: Bool) {
        withAnimation {
            if !isGuest {
                if mysteryInCasablancaFullName.isEmpty {
                    presentAlert.toggle()
                } else {
                    let fisherman = Fisherman(context: viewContext)
                    fisherman.isSoundEnable = true
                    fisherman.hooks = 20
                    fisherman.fullName = mysteryInCasablancaFullName
                    
                    for fishingRodItem in fishingRods {
                        let fishingRod = FishingRods(context: viewContext)
                        fishingRod.fishingRodName = fishingRodItem.name
                        fishingRod.fishingRodCharacteristics = fishingRodItem.description
                        fishingRod.fishingRodImage = fishingRodItem.image.prompt
                        fishingRod.isFishingRodBuyed = false
                    }
                    
                    saveContext(isGuest: isGuest)
                }
            } else {
                let fisherman = Fisherman(context: viewContext)
                fisherman.isSoundEnable = true
                fisherman.hooks = 20
                fisherman.fullName = "Guest"
                fisherman.mastery = "easy"
                
                for fishingRodItem in fishingRods {
                    let fishingRod = FishingRods(context: viewContext)
                    fishingRod.fishingRodName = fishingRodItem.name
                    fishingRod.fishingRodCharacteristics = fishingRodItem.description
                    fishingRod.fishingRodImage = fishingRodItem.image.prompt
                    fishingRod.isFishingRodBuyed = false
                }
                saveContext(isGuest: isGuest)
            }
        }
    }
    
    func saveContext(isGuest: Bool) {
        do {
            try viewContext.save()
            if isGuest {
                presentMysteryInCasablanca.toggle()
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    CreateBassView()
}
