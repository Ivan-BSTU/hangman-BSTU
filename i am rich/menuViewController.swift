import UIKit
import AVFoundation
var audioPlayer2: AVAudioPlayer?

class menuViewController: UIViewController {

    var c4 = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //проигрывание музыки на фоне
        do {
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "lofiback", ofType: "mp3")!))
            if (c4 == 1){
                audioPlayer2?.prepareToPlay()}
            
            else{audioPlayer2?.stop()}
        }
        catch {
            print(error)
        }
        if (c4 == 1) {audioPlayer2?.play()}

    }
    
    @IBAction func buttonTup(_ sender: UIButton) {
        c4 *= -1
        
        do {
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "lofiback", ofType: "mp3")!))
            if (c4 == 1){
                audioPlayer2?.prepareToPlay();
                sender.setTitle("вкл", for: .normal)
            }
            
            else{audioPlayer2?.stop();sender.setTitle("выкл", for: .normal)}
        }
        catch {
            print(error)
        }
        if (c4 == 1) {audioPlayer2?.play()}
    }
       
        
    
    
   
}
