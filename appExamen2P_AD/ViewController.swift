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

    
    
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userLabel.text! = "Bienvenido:  "+personita!.Usuario
       
    }
    
 
    
    
    //MARK: Menú de Juegos
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
    
    
    
    
    //MARK: Cerrar Sesión
    @IBAction func btnCerrar(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
    //MARK: Función Alertas
    func sendAlert(titulo: String, mensaje: String){
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

