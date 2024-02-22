import AVKit


class SoundManager: ObservableObject {
    var player: AVAudioPlayer?
    @Published var isPlaying = false

    enum Sound: String {
        case crystal
        case game_bonus
    }
    
    init(with sound: Sound) {
        if let sound = Bundle.main.path(forResource: sound.rawValue, ofType: "mp3") {
          do {
            self.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
          } catch {
            print("AVAudioPlayer could not be instantiated.")
          }
        } else {
            print("Audio \(sound.rawValue) not found.")
        }
    }
    
    func playSound() {
        guard let audioPlayer = player else { return }
  
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            isPlaying = false
        } else {
            audioPlayer.play()
            isPlaying = true
        }
    }
}
