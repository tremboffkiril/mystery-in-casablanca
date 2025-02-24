import SwiftUI

struct MysteryInCasablancaButtonStack: View {
    var buttonText: String
    @State var height: CGFloat = 48
    var body: some View {
        ZStack {
            actionColor.edgesIgnoringSafeArea(.all)
            Text(buttonText)
                .font(MysteryInCasablancaFont.bold.font(with: 17))
                .multilineTextAlignment(.center)
                .foregroundColor(goldColor)
        }
        .frame(height: height)
        .cornerRadius(10)
    }
}

#Preview {
    MysteryInCasablancaButtonStack(buttonText: "Create Mystery")
}
