//
//  ViewController.swift
//  Marvel
//
//  Created by Otto Colomina Pardo on 31/10/22.
//

import UIKit
import Marvelous

class ViewController: UIViewController {

    func mostrarPersonajes(comienzanPor cadena : String) {
            let marvelAPI = RCMarvelAPI()
            //PUEDES CAMBIAR ESTO PARA PONER TUS CLAVES
            marvelAPI.publicKey = "9f21850b7afb93929bb2f044d2d1f661"
            marvelAPI.privateKey = "59c50fcb3b22a4e64ed4827aeeb949d323fe67f0"
            let filtro = RCCharacterFilter()
            filtro.nameStartsWith = cadena
            filtro.limit = 50
            marvelAPI.characters(by: filtro) {
                resultados, info, error in
                if let personajes = resultados as? [RCCharacterObject] {
                    for personaje in personajes {
                        print(personaje.name ?? "")
                    }
                    print("Hay \(personajes.count) personajes")
                }
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // mostrarPersonajes(comienzanPor: "Spider")
    }


}

