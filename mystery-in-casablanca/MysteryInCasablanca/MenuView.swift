import SwiftUI

struct MenuView: View {
    @FetchRequest(sortDescriptors: []) var fishermen: FetchedResults<Fisherman>
    @State var presentPlay = false
    var body: some View {
        NavigationView {
            ZStack {
                bgColor.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Mystery in Casablanca")
                            .font(BassFont.regular.font(with: 34))
                            .foregroundColor(textColor)
                        Spacer()
                    }
                    
                    Image(fishermen.first?.mastery ?? "easy")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(10)
                    
                    ScrollView(.vertical) {
                        VStack {
                            Button {
                                presentPlay = true
                            } label: {
                                BassButtonStack(buttonText: BassMenu.letsFish.rawValue)
                            }
                            NavigationLink(destination: ChooseMasteryView(isCreate: false)) {
                                BassButtonStack(buttonText: BassMenu.yourMastery.rawValue)
                            }
                            Button {
                                BassRateService().rateBass()
                            } label: {
                                BassButtonStack(buttonText: BassMenu.rateUs.rawValue)
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
    @State var mysteryInCasablancaMenuType: BassMenu
    var body: some View {
        NavigationLink("") {
            BassButtonStack(buttonText: mysteryInCasablancaMenuType.rawValue)
        }
    }
}

#Preview {
    MenuView()
}
