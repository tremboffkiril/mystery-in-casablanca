import SwiftUI

struct BassButtonStack: View {
    var buttonText: String
    @State var height: CGFloat = 48
    var body: some View {
        ZStack {
            actionColor.edgesIgnoringSafeArea(.all)
            Text(buttonText)
                .font(BassFont.bold.font(with: 17))
                .multilineTextAlignment(.center)
                .foregroundColor(textColor)
        }
        .frame(height: height)
        .cornerRadius(30)
    }
}

#Preview {
    BassButtonStack(buttonText: "Create Bass")
}
