//
//  ViewController.swift
//  appExamen2P_AD
//
//  Created by ISSC_612_2022 on 29/04/22.
//

import UIKit

var Player1HM = 0
var Player2HM = 0

var Player1TTT = 0
var Player2TTT = 0

var Player1QA = 0
var Player2QA = 0

var TotalPlayer1 = 0
var TotalPlayer2 = 0

var Usuarios = [Model]()


class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var passInput: UITextField!
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passInput.isSecureTextEntry = true
    }
    
    //MARK: Events

    @IBAction func onClickLogin(_ sender: Any) {
        checkData()
    }
    
    @IBAction func onClickGame1(_ sender: Any) {
        performSegue(withIdentifier: "toHangmanGame", sender: nil)
    }
    
    @IBAction func onClickGame2(_ sender: Any) {
        performSegue(withIdentifier: "toQuestionGame", sender: nil)
    }
    
    @IBAction func onClickGame3(_ sender: Any) {
        performSegue(withIdentifier: "toTicTacToeGame", sender: nil)
    }
    
    @IBAction func onClickResults(_ sender: Any) {
        performSegue(withIdentifier: "toTotalController", sender: nil)
    }
    
    //MARK: Functions
    func checkData(){
        if(userInput.text == "" || passInput.text == "") {
            sendAlert(titulo: "Datos incompletos", mensaje: "Por favor, corrobora todos los datos")
        }
        else
        {
            let ModeloUsuario = Model(User: userInput.text!, Password: passInput.text!)
                Usuarios.append(ModeloUsuario)
            
            performSegue(withIdentifier: "toMainMenu", sender: nil)
        }
    }
    
    func sendAlert(titulo: String, mensaje: String){
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

