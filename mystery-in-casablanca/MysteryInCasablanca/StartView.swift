import SwiftUI

struct StartView: View {
    @State private var presentMysteryInCasablanca = false
    @State private var presentCreateAccount = false
    
    @FetchRequest(sortDescriptors: []) var mystery: FetchedResults<Mystery>
    let loadTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var loadTimeSeconds = 4
    
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Mystery in Casablanca")
                    .font(MysteryInCasablancaFont.regular.font(with: 34))
                    .foregroundColor(textColor)
                    .padding(.bottom, 30)
                
                ActivityIndicatorView()
                    .frame(width: 70, height: 70)
                    .foregroundColor(textColor)
            }
        }
        .fullScreenCover(isPresented: $presentCreateAccount) {
            CreateMysteryInCasablancaView()
        }
        .fullScreenCover(isPresented: $presentMysteryInCasablanca) {
            MysteryInCasablancaTabBarView()
                .onAppear {
                    MysteryInCasablancaMusicService.shared.updatePlayer(setOn: (mystery.first?.isSoundEnable ?? true))
                }
        }
        .onReceive(loadTimer) { _ in
            if loadTimeSeconds > 0 {
                loadTimeSeconds -= 1
            } else if loadTimeSeconds == .zero {
                loadTimer.upstream.connect().cancel()
                guard !mystery.isEmpty else {
                    presentCreateAccount = true
                    return
                }
                presentMysteryInCasablanca = true
            }
        }
    }
}

#Preview {
    StartView()
}
