import SwiftUI

struct BassBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("backButton")
                    .resizable()
                    .frame(width: 30, height: 30)
                Spacer()
            }
        }
    }
}

#Preview {
    BassBackButton()
}
