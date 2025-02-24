import SwiftUI

struct MenuView: View {
    @FetchRequest(sortDescriptors: []) var mystery: FetchedResults<Mystery>
    @State var presentPlay = false
    var body: some View {
        NavigationView {
            ZStack {
                bgColor.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Mystery in Casablanca")
                            .font(MysteryInCasablancaFont.regular.font(with: 34))
                            .foregroundColor(textColor)
                    }
                    
                    Image(mystery.first?.level ?? "easy")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(10)
                    
                    ScrollView(.vertical) {
                        VStack {
                            Button {
                                presentPlay = true
                            } label: {
                                MysteryInCasablancaButtonStack(buttonText: MysteryInCasablancaMenu.go.rawValue)
                            }
                            NavigationLink(destination: ChooseLevelView(isCreate: false)) {
                                MysteryInCasablancaButtonStack(buttonText: MysteryInCasablancaMenu.yourLevel.rawValue)
                            }
                            Button {
                                MysteryInCasablancaRateService().rateMysteryInCasablanca()
                            } label: {
                                MysteryInCasablancaButtonStack(buttonText: MysteryInCasablancaMenu.rateUs.rawValue)
                            }
                        }
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal)
                .padding(.bottom, 70)
            }
        }
        .fullScreenCover(isPresented: $presentPlay) {
            MysteryInCasablancaPlay()
        }
    }
}

struct MenuItex: View {
    @State var mysteryInCasablancaMenuType: MysteryInCasablancaMenu
    var body: some View {
        NavigationLink("") {
            MysteryInCasablancaButtonStack(buttonText: mysteryInCasablancaMenuType.rawValue)
        }
    }
}

#Preview {
    MenuView()
}
