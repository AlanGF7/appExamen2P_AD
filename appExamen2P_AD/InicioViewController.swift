//
//  InicioViewController.swift
//  appExamen2P_AD
//
//  Created by Alan Guzmán Flores on 19/05/22.
//

import UIKit

var usuarioLogueado : Model?
var usuarioLogIndex = Int()

class InicioViewController: UIViewController {
    
    //MARK: ISesión contenedores
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var passInput: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    //MARK: Inicio Sesión
    @IBAction func onClickLogin(_ sender: Any) {
        checkData()
    }
    
    //MARK: Inicio Sesión - Validación
    func checkData(){
        
        if(userInput.text == "" || passInput.text == "") {
            sendAlert(titulo: "Datos incompletos", mensaje: "Por favor, corrobora todos los datos")
        }
        else{
            
            if(persona.count == 0){
                sendAlert(titulo: "ERROR:", mensaje: "Usuario inválido, favor de resgistrarse")
            }
            else{
                for  i in 1...persona.count{
                    if(persona[i - 1].Usuario == userInput.text && persona[i - 1].Pass == passInput.text)
                    {
                        //Remove
                        usuarioLogIndex = i-1
                       
                        //Perfil
                        usuarioLogueado = persona[i-1]
                        
                        personita!.Usuario = usuarioLogueado!.Usuario
                        personita!.Nombre = usuarioLogueado!.Nombre
                        personita!.Apellido = usuarioLogueado!.Apellido
                        
                        print("Usuario")
                        print(persona[i-1])
                        print(usuarioLogIndex)
                        
                        performSegue(withIdentifier: "toMainMenu", sender: self)
                        
                    }
                }
                
            }
        }
        
       
        
    }
    
    //MARK: Inicio Sesión Registro
    @IBAction func btnRegistro(_ sender: Any) {
        performSegue(withIdentifier: "Registro", sender: self)
        
    }
    
    func sendAlert(titulo: String, mensaje: String){
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }

}
