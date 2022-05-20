//
//  PerfilViewController.swift
//  appExamen2P_AD
//
//  Created by Alan Guzmán Flores on 19/05/22.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblApellido: UILabel!
    @IBOutlet weak var lblUsuario: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNombre.becomeFirstResponder()
        lblApellido.becomeFirstResponder()
        lblUsuario.becomeFirstResponder()
    
        lblNombre.text! = personita!.Nombre
        lblApellido.text! = personita!.Apellido
        lblUsuario.text! = personita!.Usuario
    }
    
    @IBAction func btnCerrar(_ sender: Any) {
        
        persona.remove(at:usuarioLogIndex)
        for  i in 1...persona.count{
            print( persona[i-1].Usuario)
        }
       
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
