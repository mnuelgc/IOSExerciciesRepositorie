//
//  DetallesController.swift
//  Marvel
//
//  Created by Raquel Guerrero Perucho on 6/11/23.
//

import UIKit
import Marvelous

class DetallesController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var bio: UITextView!
    
    @IBOutlet weak var image: UIImageView!
    
    var character : RCCharacterObject!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text = self.character.name
        self.bio.text = self.character.bio
        //  self.bio.text = self.character.bio
        // Do any additional setup after loading the view.
        
        let colaBackground = OperationQueue()
        colaBackground.addOperation {
            //SUPONIENDO que la variable con el personaje se llama "personaje"
            if let thumb = self.character.thumbnail {
                //portrait_uncanny es 300x450px. Puedes cambiarlo por otro tamaño si prefieres
                let url = "\(thumb.basePath!)/portrait_uncanny.\(thumb.extension!)"
                //cambiamos la URL por https://. Necesario en iOS
                let urlHttps = url.replacingOccurrences(of: "http", with: "https")
                if let urlFinal = URL(string:urlHttps) {
                    do {
                        let datos = try Data(contentsOf:urlFinal)
                        if let img = UIImage(data: datos) {
                            OperationQueue.main.addOperation {
                                //suponiendo que el outlet de la imagen se llama "miImagen"
                                self.image.image = img
                            }
                        }
                    }
                    catch {
                    }
                }
            }
        }
    }
}
