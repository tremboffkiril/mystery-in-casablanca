import SwiftUI

struct MysteryInCasablancaTabBarView: View {
    @State var mysteryInCasablancaSelectedTab = "1"

    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $mysteryInCasablancaSelectedTab) {
                MenuView()
                    .tag("1")
                FishingRodsView()
                    .tag("2")
                BassRecordsView()
                    .tag("3")
                BassProfileView()
                    .tag("4")
            }
            
            HStack(spacing: 20) {
                ForEach(mysteryInCasablancaTabs, id: \.self) { mysteryInCasablancaTab in
                    MysteryInCasablancaTabBarItemView(mysteryInCasablancaTab: mysteryInCasablancaTab,
                                            mysteryInCasablancaSelected: $mysteryInCasablancaSelectedTab)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
            .padding(.bottom, 20)
            .background(.clear)
        }
    }
}
#Preview {
    MysteryInCasablancaTabBarView()
}
