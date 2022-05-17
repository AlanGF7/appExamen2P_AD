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
    
    @IBOutlet weak var imageLife1: UIImageView!
    @IBOutlet weak var imageLife2: UIImageView!
    @IBOutlet weak var imageLife3: UIImageView!
    
    @IBOutlet weak var imageLife1P2: UIImageView!
    @IBOutlet weak var imageLife2P2: UIImageView!
    @IBOutlet weak var imageLife3P2: UIImageView!
    
    
    enum Turn{
        case P1
        case P2
    }
    //Palabras para jugador 1
    let Words5P1 = ["perro","cinco","canto","cruel"]
    let Words6P1 = ["cuatro","whisky","aretes","bienes"]
    let Words7P1 = ["agendas","botones","bolivia","carrito"]
    
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
    var WordCompleted = 0
    
    // Son 3 vidas
    var P1Lifes = 3
    var P2Lifes = 3
    
    @IBAction func onClickJugar(_ sender: Any) {
        Try = inputCharacter.text ?? "e"
        
        if Word.contains(Try.lowercased()) {
            checkWordChar(word: Word, character: Try)
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
                checkLifes()
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
                showWord5()
                clearWord5()
                hideWord6()
                hideWord7()
                Word = Words5P1[WordsChosen]
                print(WordsLength)
                print(WordsChosen)
                print(Word)
            case 1:
                showWord6()
                clearWord6()
                hideWord5()
                hideWord7()
                Word = Words6P1[WordsChosen]
                print(Word)
            case 2:
                showWord7()
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
                showWord5()
                clearWord5()
                hideWord6()
                hideWord7()
                Word = Words5P2[WordsChosen]
                print(Word)
            case 1:
                showWord6()
                clearWord6()
                hideWord5()
                hideWord7()
                Word = Words6P2[WordsChosen]
                print(Word)
            case 2:
                showWord7()
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
    
    func printCharacter(Length: Int, index: Int, character: String)
    {
        switch Length{
        case 0:
            switch index {
                case 0:
                    A5.text = character
                case 1:
                    B5.text = character
                case 2:
                    C5.text = character
                case 3:
                    D5.text = character
                case 4:
                    E5.text = character
                default:
                    print("Algo falló en el index...")
            }
        case 1:
            switch index {
                case 0:
                    A6.text = character
                case 1:
                    B6.text = character
                case 2:
                    C6.text = character
                case 3:
                    D6.text = character
                case 4:
                    E6.text = character
                case 5:
                    F6.text = character
                default:
                    print("Algo falló en el index...")
            }
        case 2:
            switch index {
                case 0:
                    A7.text = character
                case 1:
                    B7.text = character
                case 2:
                    C7.text = character
                case 3:
                    D7.text = character
                case 4:
                    E7.text = character
                case 5:
                    F7.text = character
                case 6:
                    G7.text = character
                default:
                    print("Algo falló en el index...")
            }
            
        default:
            print("Algo falló...")
        }
    }
    
    func checkWordChar(word: String, character: String){
        var index = 0
        switch WordsLength {
        case 0:
            for char in word
            {
                if(char.lowercased() == character.lowercased())
                {
                    printCharacter(Length: WordsLength, index: index, character: character)
                    WordCompleted += 1
                }
                index += 1
                if(WordCompleted == 5)
                {
                    resultAlert(title: "Ganador!", message: "¡Bien hecho!")
                    hangmanImage.image = UIImage(named:"ganar")
                    WordCompleted = 0
                }
            }
        case 1:
            for char in word
            {
                if(char.lowercased() == character.lowercased())
                {
                    printCharacter(Length: WordsLength, index: index, character: character)
                    WordCompleted += 1
                }
                index += 1
                if(WordCompleted == 6)
                {
                    resultAlert(title: "Ganador!", message: "¡Bien hecho!")
                    hangmanImage.image = UIImage(named:"ganar")
                    WordCompleted = 0
                }
            }
        case 2:
            for char in word
            {
                if(char.lowercased() == character.lowercased())
                {
                    printCharacter(Length: WordsLength, index: index, character: character)
                    WordCompleted += 1
                }
                index += 1
                if(WordCompleted == 7)
                {
                    resultAlert(title: "Ganador!", message: "¡Bien hecho!")
                    hangmanImage.image = UIImage(named:"ganar")
                    WordCompleted = 0
                }
            }
        default:
            print("Algo falló...")
        }
    }
    
    // Hide the inputs for words
    
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
    
    //Show the inputs for the words
    func showWord5(){
        A5.isHidden = false
        B5.isHidden = false
        C5.isHidden = false
        D5.isHidden = false
        E5.isHidden = false
    }
    
    func showWord6(){
        A6.isHidden = false
        B6.isHidden = false
        C6.isHidden = false
        D6.isHidden = false
        E6.isHidden = false
        F6.isHidden = false
    }
    
    func showWord7(){
        A7.isHidden = false
        B7.isHidden = false
        C7.isHidden = false
        D7.isHidden = false
        E7.isHidden = false
        F7.isHidden = false
        G7.isHidden = false
    }
    
    
    //Clear the inputs for the words
    
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
    
    func checkLifes(){
        if(firstTurn == Turn.P1)
        {
            P1Lifes -= 1
            switch P1Lifes
            {
            case 0:
                imageLife3.isHidden = true
                P1Lifes = 3
                P2Lifes = 3
                loserAlert(title: "Pierde jugador 1", message: "Suerte para la próxima :(")
            case 1:
                imageLife2.isHidden = true
            case 2:
                imageLife1.isHidden = true
            case 3:
                imageLife3.isHidden = false
                imageLife2.isHidden = false
                imageLife1.isHidden = false
            default:
                print("Checa bien las vidas")
            }
        }
        else
        {
            P2Lifes -= 1
            switch P2Lifes
            {
            case 0:
                P2Lifes = 3
                P1Lifes = 3
                imageLife3P2.isHidden = true
                loserAlert(title: "Pierde jugador 2", message: "Suerte para la próxima :(")
            case 1:
                imageLife2P2.isHidden = true
            case 2:
                imageLife1P2.isHidden = true
            case 3:
                imageLife3P2.isHidden = false
                imageLife2P2.isHidden = false
                imageLife1P2.isHidden = false
            default:
                print("Checa bien las vidas")
            }
        }
    }
    
    func resultAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in self.resetGame()
        }))
        
        self.present(alert, animated: true)
    }
    
    func loserAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in self.endedGame()
        }))
        
        self.present(alert, animated: true)
    }
    
    func resetGame()
    {
        if(firstTurn == Turn.P1)
        {
            firstTurn = Turn.P2
            playerLabel.text = "Jugador 2"
            Player1HM += 1
        }
        else if(firstTurn == Turn.P2)
        {
            firstTurn = Turn.P1
            playerLabel.text = "Jugador 1"
            Player2HM += 1
            WordsLength = Int.random(in: 0...2)
            WordsChosen = Int.random(in: 0...3)
        }
        
        currentTurn = firstTurn
        checkPlayerWords()
        hangmanImage.image = UIImage(named:"horca")
    }
    
    func endedGame(){
        imageLife1.isHidden = false
        imageLife2.isHidden = false
        imageLife3.isHidden = false
        
        imageLife1P2.isHidden = false
        imageLife2P2.isHidden = false
        imageLife3P2.isHidden = false
        
        currentTurn = firstTurn
        checkPlayerWords()
        hangmanImage.image = UIImage(named:"horca")
    }
    
}
