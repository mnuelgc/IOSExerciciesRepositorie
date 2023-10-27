//
//  ViewController.swift
//  spaceShipControls
//
//  Created by Manuel Gómez Cámara on 26/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editTextObject: UITextField!
    
    @IBOutlet weak var text: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func introPressed(_ sender: UITextField) {
        
        if let texto = editTextObject.text{
            if (texto != ""){
                text.text += texto + "\n"
            }
        }

        sender.resignFirstResponder()

    }
    
    
    
}

