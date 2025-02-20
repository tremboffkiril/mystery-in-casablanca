import SwiftUI

struct MysteryInCasablancaPlayFinish: View {
    @State var presentBack = false
    @State var fishingRodsWoned = 0
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Finish")
                        .font(BassFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                    Spacer()
                }
                Spacer()
                Text("Great!")
                    .font(BassFont.bold.font(with: 28))
                    .foregroundColor(textColor)
                    .padding(.bottom, 20)
                Text("You are collected")
                    .font(BassFont.regular.font(with: 24))
                    .foregroundColor(.gray)
                HStack {
                    Text("\(fishingRodsWoned)")
                        .font(BassFont.regular.font(with: 24))
                        .foregroundColor(.gray)
                    Image("fishingShop")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(10)
                }
                Spacer()
                Button {
                    presentBack = true
                } label: {
                    BassButtonStack(buttonText: "Close")
                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $presentBack) {
            MysteryInCasablancaTabBarView()
        }
    }
}

#Preview {
    MysteryInCasablancaPlayFinish()
}
