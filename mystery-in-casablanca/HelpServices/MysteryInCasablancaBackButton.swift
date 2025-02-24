import SwiftUI

struct MysteryInCasablancaBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back")
                    .resizable()
                    .frame(width: 100, height: 80)
                Spacer()
            }
        }
    }
}

#Preview {
    MysteryInCasablancaBackButton()
}
