import SwiftUI

struct CreateMysteryInCasablancaView: View {
    @FetchRequest(sortDescriptors: []) var mystery: FetchedResults<Mystery>
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
                        Text("Create your Mystery")
                            .font(MysteryInCasablancaFont.regular.font(with: 34))
                            .foregroundColor(textColor)
                    }
                    
                    Spacer()
                    MysteryInCasablancaTexFieldStack(placeholderText: "Full name",
                                      input: $mysteryInCasablancaFullName)
                    
                    Spacer()
                    NavigationLink(destination: ChooseLevelView()) {
                        MysteryInCasablancaButtonStack(buttonText: "Create Mystery")
                    }.simultaneousGesture(TapGesture().onEnded {
                        createMysteryInCasablanca(isGuest: false)
                    })
                    
                    Button {
                        createMysteryInCasablanca(isGuest: true)
                    } label: {
                        MysteryInCasablancaButtonStack(buttonText: "Close creating")
                    }
                }
                .padding()
            }
        }
        .fullScreenCover(isPresented: $presentMysteryInCasablanca) {
            MysteryInCasablancaTabBarView()
                .onAppear {
                    MysteryInCasablancaMusicService.shared.updatePlayer(setOn: (mystery.first?.isSoundEnable ?? true))
                }
        }
        .alert("Enter full name for continue", isPresented: $presentAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

extension CreateMysteryInCasablancaView {
    func createMysteryInCasablanca(isGuest: Bool) {
        withAnimation {
            if !isGuest {
                if mysteryInCasablancaFullName.isEmpty {
                    presentAlert.toggle()
                } else {
                    let mystery = Mystery(context: viewContext)
                    mystery.isSoundEnable = true
                    mystery.hooks = 20
                    mystery.fullName = mysteryInCasablancaFullName
                    
                    for stickItem in stickCollection {
                        let stick = Stick(context: viewContext)
                        stick.stickName = stickItem.name
                        stick.stickCharacteristics = stickItem.description
                        stick.stickImage = stickItem.image.name
                        stick.isStickBuyed = false
                    }
                    
                    saveContext(isGuest: isGuest)
                }
            } else {
                let mystery = Mystery(context: viewContext)
                mystery.isSoundEnable = true
                mystery.hooks = 20
                mystery.fullName = "Guest"
                mystery.level = "easy"
                
                for stickItem in stickCollection {
                    let stick = Stick(context: viewContext)
                    stick.stickName = stickItem.name
                    stick.stickCharacteristics = stickItem.description
                    stick.stickImage = stickItem.image.name
                    stick.isStickBuyed = false
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
    CreateMysteryInCasablancaView()
}
