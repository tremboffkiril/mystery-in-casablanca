import SwiftUI

struct MysteryInCasablancaPlayFinish: View {
    @State var presentBack = false
    @State var sticksWoned = 0
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Finish")
                        .font(MysteryInCasablancaFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                }
                Spacer()
                Text("Nice try!")
                    .font(MysteryInCasablancaFont.bold.font(with: 28))
                    .foregroundColor(textColor)
                    .padding(.bottom, 20)
                Text("You are now have:")
                    .font(MysteryInCasablancaFont.regular.font(with: 24))
                    .foregroundColor(.gray)
                HStack {
                    Text("\(sticksWoned)")
                        .font(MysteryInCasablancaFont.regular.font(with: 24))
                        .foregroundColor(.gray)
                    Image("stickShop")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(10)
                }
                Spacer()
                Button {
                    presentBack = true
                } label: {
                    MysteryInCasablancaButtonStack(buttonText: "Close")
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
