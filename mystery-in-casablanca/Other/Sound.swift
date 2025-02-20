import SwiftUI
import AVFoundation
import AVFAudio
import Combine
import MediaPlayer

final class Sound {
    static let shared = Sound()
    private var player: AVAudioPlayer?
    private var session = AVAudioSession.sharedInstance()
    private var canellable: AnyCancellable?
    
    private init() {}
    deinit {
        canellable?.cancel()
    }
    
    private func activateSession() {
        do {
            try session.setCategory(
                .playback,
                mode: .default,
                options: []
            )
        } catch _ {
            
        }
        do {
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch _ {
            
        }
           
        do {
            try session.overrideOutputAudioPort(.speaker)
        } catch _ {
            
        }
    }
    
    func startAudio() {
        activateSession()
        guard let sound = Bundle.main.path(forResource: "wild", ofType: "mp3"),
              let avPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound)) else {
            return
        }
        player = avPlayer
        player?.numberOfLoops = -1
        
        if let player = player {
            player.play()
        }
    }
    
    func deactivateSession() {
        do {
            try session.setActive(false, options: .notifyOthersOnDeactivation)
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }
    
    func stop() {
        if let player = player {
            player.stop()
        }
    }
    
    func updatePlayer(setOn: Bool) {
        if !setOn {
            stop()
        } else {
            startAudio()
        }
        setVolume(setOn: setOn)
    }
    
    private func setVolume(setOn: Bool) -> Void {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = !setOn ? 0.0 : 0.5
        }
    }
}


