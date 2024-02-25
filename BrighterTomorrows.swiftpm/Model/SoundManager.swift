/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Dribbble,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
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
