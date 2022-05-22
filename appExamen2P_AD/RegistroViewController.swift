//
//  RegistroViewController.swift
//  appExamen2P_AD
//
//  Created by Alan Guzmán Flores on 19/05/22.
//

import UIKit

//Lista de clase Persona
var persona = [Model]()
var personita : Model?


class RegistroViewController: UIViewController {
    
    @IBOutlet weak var edtNombre: UITextField!
    @IBOutlet weak var edtApellido: UITextField!
    @IBOutlet weak var edtUsuario: UITextField!
    @IBOutlet weak var pass: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        edtNombre.becomeFirstResponder()
        edtApellido.becomeFirstResponder()
        edtUsuario.becomeFirstResponder()
        pass.becomeFirstResponder()
        
    }
    
    
    @IBAction func btnAgregar(_ sender: Any) {
        var modeloPersona = Model(Nombre: edtNombre.text!, Apellido: edtApellido.text!, Usuario: edtUsuario.text!, Pass: pass.text!)
        
        persona.append(modeloPersona)
        
        
        usuarioLogIndex = persona.endIndex-1
        
        personita = persona.last
       
        
        edtNombre.text=""
        edtApellido.text=""
        edtUsuario.text=""
        pass.text=""
    }
    

}
