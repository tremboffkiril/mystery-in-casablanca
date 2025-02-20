import SwiftUI

struct FishingRodsDetailsView: View {
    @State var fishingRod: FishingRods
    @Environment(\.presentationMode) private var present
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text(fishingRod.fishingRodName ?? "")
                        .font(BassFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                    Spacer()
                }
                
                Image(fishingRod.fishingRodImage ?? "")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                ScrollView {
                    Text(fishingRod.fishingRodCharacteristics ?? "")
                        .font(BassFont.medium.font(with: 21))
                        .foregroundColor(.gray)
                }
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    BassButtonStack(buttonText: "Close")
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    FishingRodsDetailsView()
//}
