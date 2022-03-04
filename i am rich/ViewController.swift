import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {
    
   
    var audioPlayer: AVAudioPlayer?
    
    
    var soundV:Int = 4095
    @IBOutlet weak var imageDown: UIImageView!
    @IBOutlet weak var looseScreen: UIImageView!
    @IBOutlet weak var looseImage: UIImageView!
    @IBOutlet weak var playerCondition: UIImageView!
    
    @IBOutlet weak var labelWord: UILabel!
    var textFromChoice:String!
    var c1 = 1
    var c2 = 1
    
    
    var img = #imageLiteral(resourceName: "screen-3")
    
    var words = ["брянск","москва","калуга","минск"]
    var a = 0
    var usedLetters = [Character]()
    //выбранное слово из массива
    var word = ""
    
    var wrongLettersArray = [Character]()
    var displayWord = ""
    var guess:Character!
    
    var displayWordArray = [Character]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //выбираем рандомный элемент списка
        word = words.randomElement()!
        //использованные буквы
        
        
        usedLetters = Array(word)
        
        title = textFromChoice
        
        backgroundImage.image = img
       
        for letters in 1...word.count{
            
            displayWord += "?"
            labelWord.text = displayWord
            displayWordArray = Array(displayWord)
            
        }
        
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var alphabetArr = ["й","ц","у","к","е","н","г","ш","щ","з","х","ъ","ф","ы","в","а","п","р","о","л","д","ж","э","ё","я","ч","с","м","и","т","ь","б","ю"]
    var b = 0
    
    var c = 0
    @IBAction func actionTuped(_ sender : UIButton) {
        
        let newVC2 = storyboard?.instantiateViewController(withIdentifier: "menuViewController") as! menuViewController
       
        if (b+1 <= word.count && word.contains(alphabetArr[sender.tag])){
            for letters in 0...word.count-1{
                if (alphabetArr[sender.tag] == String(usedLetters[letters])){
                    
                    displayWordArray.remove(at: letters)
                    displayWordArray.insert(contentsOf: alphabetArr[sender.tag], at: letters)
            
                    displayWord = String(displayWordArray)
                    labelWord.text = displayWord
                    displayWordArray = Array(displayWord)
                    
                    sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                    sender.isEnabled = false
                    b+=1
                }
            }
    
            if (b == word.count){looseScreen.image = #imageLiteral(resourceName: "pngwing.com"); looseScreen.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1);a = 8; soundV = 0; c = 1;
                
                let pathToSound = Bundle.main.path(forResource: "meow", ofType: "mp3")!
                let url = URL(fileURLWithPath: pathToSound)
                do{
                    if (c1 == 1){
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.play()
                        //переключатель звука 1
                       c1 *= -1
                    }
               


                } catch {}
            }

        }
        
        else{
            AudioServicesPlaySystemSound(SystemSoundID(soundV))
            if (a + 1 <= 6 && b <= word.count){a+=1; playerCondition.image = [#imageLiteral(resourceName: "pixil-frame-0"), #imageLiteral(resourceName: "pixil-frame-0 (2)"), #imageLiteral(resourceName: "pixil-frame-0 (3)"), #imageLiteral(resourceName: "pixil-frame-0 (4)"), #imageLiteral(resourceName: "pixil-frame-0 (5)"), #imageLiteral(resourceName: "pixil-frame-0 (6)"), #imageLiteral(resourceName: "pixil-frame-0 (7)"), #imageLiteral(resourceName: "pixil-frame-0 (8)")][a];sender.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1);sender.isEnabled = false}
            else {
                if (c == 0)
                {
                looseScreen.image = #imageLiteral(resourceName: "klipartz.com"); looseScreen.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1); b = 8; soundV = 0; labelWord.text = "Ответ: \(word)";
                let pathToSound = Bundle.main.path(forResource: "roblox", ofType: "mp3")!
                let url = URL(fileURLWithPath: pathToSound)
                do{
                    if (c2 == 1){
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.play()
                        //переключатель звука
                        c2 *= -1
                    }
                    
                    
                } catch {}
                
            }
            }
        }
        
        
    }
    
    
}

