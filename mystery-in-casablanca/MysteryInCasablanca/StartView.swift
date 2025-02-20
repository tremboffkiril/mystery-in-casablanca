import SwiftUI

struct StartView: View {
    @State private var presentBass = false
    @State private var presentCreateAccount = false
    
    @FetchRequest(sortDescriptors: []) var fishermen: FetchedResults<Fisherman>
    let loadTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var loadTimeSeconds = 4
    
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Mystery in Casablanca")
                    .font(BassFont.regular.font(with: 34))
                    .foregroundColor(textColor)
                
                ActivityIndicatorView()
                    .frame(width: 70, height: 70)
                    .foregroundColor(actionColor)
            }
        }
        .fullScreenCover(isPresented: $presentCreateAccount) {
            CreateBassView()
        }
        .fullScreenCover(isPresented: $presentBass) {
            MysteryInCasablancaTabBarView()
                .onAppear {
                    BassMusicService.shared.updatePlayer(setOn: (fishermen.first?.isSoundEnable ?? true))
                }
        }
        .onReceive(loadTimer) { _ in
            if loadTimeSeconds > 0 {
                loadTimeSeconds -= 1
            } else if loadTimeSeconds == .zero {
                loadTimer.upstream.connect().cancel()
                guard !fishermen.isEmpty else {
                    presentCreateAccount = true
                    return
                }
                presentBass = true
            }
        }
    }
}

#Preview {
    StartView()
}
