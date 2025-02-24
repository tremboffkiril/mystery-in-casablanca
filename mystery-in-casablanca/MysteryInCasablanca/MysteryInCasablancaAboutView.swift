import SwiftUI

struct MysteryInCasablancaAboutView: View {
    @Environment(\.presentationMode) private var present
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("About")
                        .font(MysteryInCasablancaFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                }
                Text(mysteryInCasablancaAbout)
                    .font(MysteryInCasablancaFont.bold.font(with: 20))
                    .foregroundColor(.gray)
                    .padding(.top, 15)
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    MysteryInCasablancaButtonStack(buttonText: "Close")
                }
            }.padding()
        }
    }
}

#Preview {
    MysteryInCasablancaAboutView()
}
