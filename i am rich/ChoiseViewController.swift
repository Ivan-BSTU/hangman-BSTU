import UIKit

class ChoiseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

        
    
        
    @IBAction func themeChoise(_ sender: Any) {
        
        
        var towns: [String]?

           do {
               // This solution assumes  you've got the file in your bundle
               if let path = Bundle.main.path(forResource: "town", ofType: "txt"){
                   let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                   towns = data.components(separatedBy: "\n")
                   
               }
           } catch let err as NSError {
               // do something with Error
               print(err)
           }
        towns?.removeLast()
        
        var animals: [String]?

           do {
               // This solution assumes  you've got the file in your bundle
               if let path = Bundle.main.path(forResource: "animal", ofType: "txt"){
                   let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                   animals = data.components(separatedBy: "\n")
                   
               }
           } catch let err as NSError {
               // do something with Error
               print(err)
           }
        animals?.removeLast()
        
       
        var plants: [String]?

           do {
               // This solution assumes  you've got the file in your bundle
               if let path = Bundle.main.path(forResource: "plant", ofType: "txt"){
                   let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                   plants = data.components(separatedBy: "\n")
                   
               }
           } catch let err as NSError {
               // do something with Error
               print(err)
           }
        plants?.removeLast()

    var choice = ""
    let newVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        if ((sender as AnyObject).tag == 0){choice = "Тема: Города";newVC.img = #imageLiteral(resourceName: "screen-3"); newVC.words = towns! }
            
        if ((sender as AnyObject).tag == 1){choice = "Тема: Животные";newVC.img = #imageLiteral(resourceName: "kaliaoS-1");
            newVC.words = animals!
        }
            
        if ((sender as AnyObject).tag == 2){choice = "Тема: Растения";newVC.img = #imageLiteral(resourceName: "63ad5c20c982894a061a27dbb20ffa0e");
            newVC.words = plants!
        }
        
        newVC.textFromChoice = choice
        
        navigationController?.pushViewController(newVC, animated: true)
        
}

}
