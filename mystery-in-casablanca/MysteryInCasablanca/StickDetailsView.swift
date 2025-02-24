import SwiftUI

struct StickDetailsView: View {
    @State var stick: Stick
    @Environment(\.presentationMode) private var present
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text(stick.stickName ?? "")
                        .font(MysteryInCasablancaFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                }
                
                Image(stick.stickImage ?? "")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                ScrollView {
                    Text(stick.stickCharacteristics ?? "")
                        .font(MysteryInCasablancaFont.medium.font(with: 21))
                        .foregroundColor(.gray)
                }
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    MysteryInCasablancaButtonStack(buttonText: "Close")
                }
            }
            .padding()
        }
    }
}
