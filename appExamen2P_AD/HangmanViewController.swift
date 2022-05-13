//
//  HangmanViewController.swift
//  appExamen2P_AD
//
//  Created by ISSC_612_2022 on 29/04/22.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var inputCharacter: UITextField!
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var playerLabel: UILabel!
    
    
    @IBOutlet weak var A5: UILabel!
    @IBOutlet weak var B5: UILabel!
    @IBOutlet weak var C5: UILabel!
    @IBOutlet weak var D5: UILabel!
    @IBOutlet weak var E5: UILabel!
    
    @IBOutlet weak var A6: UILabel!
    @IBOutlet weak var B6: UILabel!
    @IBOutlet weak var C6: UILabel!
    @IBOutlet weak var D6: UILabel!
    @IBOutlet weak var E6: UILabel!
    @IBOutlet weak var F6: UILabel!
    
    @IBOutlet weak var A7: UILabel!
    @IBOutlet weak var B7: UILabel!
    @IBOutlet weak var C7: UILabel!
    @IBOutlet weak var D7: UILabel!
    @IBOutlet weak var E7: UILabel!
    @IBOutlet weak var F7: UILabel!
    @IBOutlet weak var G7: UILabel!
    
    
    enum Turn{
        case P1
        case P2
    }
    
    
    //Palabras para jugador 1
    let Words5P1 = ["perro","cinco","canto","cruel"]
    let Words6P1 = ["cuatro","whisky","aretes","bienes"]
    let Words7P1 = ["agenda","botones","bolivia","carrito"]
    
    //Palabras para jugador 2
    let Words5P2 = ["anana","nubes","latas","afore"]
    let Words6P2 = ["ciegos","dioses","fabula","europa"]
    let Words7P2 = ["boscosa","cerrojo","debates","experto"]
    
    var WordsCount = 0
    
    var firstTurn = Turn.P1
    var currentTurn = Turn.P1
    
    var Word = ""
    var WordsLength = 0
    var WordsChosen = 0
    var Try = ""
    var Oportunities = 0
    
    // Son 3 vidas
    @IBAction func onClickJugar(_ sender: Any) {
        Try = inputCharacter.text ?? "e"
        
        if Word.contains(Try.lowercased()) {
            checkWordChar(word: Try)
        }
        else
        {
            Oportunities += 1
            switch Oportunities {
            case 1:
                hangmanImage.image = UIImage(named:"1")
            case 2:
                hangmanImage.image = UIImage(named:"2")
            case 3:
                hangmanImage.image = UIImage(named:"3")
            case 4:
                hangmanImage.image = UIImage(named:"4")
            case 5:
                hangmanImage.image = UIImage(named:"5")
            case 6:
                hangmanImage.image = UIImage(named:"6")
            case 7:
                hangmanImage.image = UIImage(named:"perder")
                resultAlert(title: "Ops!", message: "Suerte para la próxima " )
                Oportunities = 0
            default:
                print("Algo falló...")
            }
        }
        inputCharacter.text = nil
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WordsLength = Int.random(in: 0...2)
        WordsChosen = Int.random(in: 0...3)
        checkPlayerWords()
        
        hangmanImage.image = UIImage(named:"horca")
        
    }
    
    func checkPlayerWords(){
        if(firstTurn == Turn.P1)
        {
            switch WordsLength {
            case 0:
                clearWord5()
                hideWord6()
                hideWord7()
                Word = Words5P1[WordsChosen]
                print(WordsLength)
                print(WordsChosen)
                print(Word)
            case 1:
                clearWord6()
                hideWord5()
                hideWord7()
                Word = Words6P1[WordsChosen]
                print(Word)
            case 2:
                clearWord7()
                hideWord5()
                hideWord6()
                Word = Words7P1[WordsChosen]
                print(Word)
            default:
                print("Algo falló...")
            }
        }
        else{
            switch WordsLength {
            case 0:
                clearWord5()
                hideWord6()
                hideWord7()
                Word = Words5P2[WordsChosen]
                print(Word)
            case 1:
                clearWord6()
                hideWord5()
                hideWord7()
                Word = Words6P2[WordsChosen]
                print(Word)
            case 2:
                clearWord7()
                hideWord5()
                hideWord6()
                Word = Words7P2[WordsChosen]
                print(Word)
            default:
                print("Algo falló...")
            }
        }
    }
    
    func checkWordChar(word: String){
        switch WordsLength {
        case 0:
            A5.text = word
        case 1:
            A6.text = word
        case 2:
            A7.text = word
        default:
            print("Algo falló...")
        }
    }
    
    func hideWord5(){
        A5.isHidden = true
        B5.isHidden = true
        C5.isHidden = true
        D5.isHidden = true
        E5.isHidden = true
    }
    
    func hideWord6(){
        A6.isHidden = true
        B6.isHidden = true
        C6.isHidden = true
        D6.isHidden = true
        E6.isHidden = true
        F6.isHidden = true
    }
    
    func hideWord7(){
        A7.isHidden = true
        B7.isHidden = true
        C7.isHidden = true
        D7.isHidden = true
        E7.isHidden = true
        F7.isHidden = true
        G7.isHidden = true
    }
    
    func clearWord5(){
        A5.text = nil
        B5.text = nil
        C5.text = nil
        D5.text = nil
        E5.text = nil
    }
    
    func clearWord6(){
        A6.text = nil
        B6.text = nil
        C6.text = nil
        D6.text = nil
        E6.text = nil
        F6.text = nil
    }
    
    func clearWord7(){
        A7.text = nil
        B7.text = nil
        C7.text = nil
        D7.text = nil
        E7.text = nil
        F7.text = nil
        G7.text = nil
    }
    
    func resultAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in self.resetGame()
        }))
        
        self.present(alert, animated: true)
            
    }
    
    func resetGame(){
        
        if(firstTurn == Turn.P1)
        {
            firstTurn = Turn.P2
            playerLabel.text = "Jugador 2"
        }
        else if(firstTurn == Turn.P2)
        {
            firstTurn = Turn.P1
            playerLabel.text = "Jugador 1"
        }
        
        currentTurn = firstTurn
        checkPlayerWords()
        hangmanImage.image = UIImage(named:"horca")
        
    }
    
}
