import SwiftUI

struct BassTexFieldStack: View {
    @State var height: CGFloat = 48
    @State var placeholderText: String
    @Binding var input: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .stroke(actionColor, lineWidth: 3)
            
            TextField("", text: $input)
                .textFieldPlaceholder(when: input.isEmpty) {
                    Text(placeholderText).foregroundColor(.gray.opacity(0.5))
                        .font(BassFont.medium.font(with: 14))
                }
                .font(BassFont.medium.font(with: 14))
                .foregroundColor(actionColor)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
            
        }
        .frame(height: height)
        .cornerRadius(30)
    }
}
