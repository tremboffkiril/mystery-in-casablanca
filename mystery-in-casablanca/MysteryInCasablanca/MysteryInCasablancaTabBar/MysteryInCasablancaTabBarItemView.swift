import SwiftUI

struct MysteryInCasablancaTabBarItemView: View {
    @State var mysteryInCasablancaTab: BassTab
    @Binding var mysteryInCasablancaSelected: String
    var body: some View {
        ZStack {
            Button {
                withAnimation(.spring()) {
                    mysteryInCasablancaSelected = mysteryInCasablancaTab.mysteryInCasablancaTabTag
                }
            } label: {
                VStack {
                    Image(mysteryInCasablancaSelected == mysteryInCasablancaTab.mysteryInCasablancaTabTag ? mysteryInCasablancaTab.mysteryInCasablancaTabIconSelected : mysteryInCasablancaTab.mysteryInCasablancaTabIcon)
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text(mysteryInCasablancaTab.mysteryInCasablancaTabName)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(mysteryInCasablancaSelected == mysteryInCasablancaTab.mysteryInCasablancaTabTag ? actionColor : .gray)
                }
            }
        }
        .padding(.vertical, -15)
        .padding(.horizontal, 5)
        .background(.clear)
    }
}
