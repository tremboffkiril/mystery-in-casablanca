import SwiftUI

struct BassAboutView: View {
    @Environment(\.presentationMode) private var present
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("About")
                        .font(BassFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                    Spacer()
                }
                Text(mysteryInCasablancaAbout)
                    .font(BassFont.bold.font(with: 20))
                    .foregroundColor(.gray)
                    .padding(.top, 15)
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    BassButtonStack(buttonText: "Close")
                }
            }.padding()
        }
    }
}

#Preview {
    BassAboutView()
}
