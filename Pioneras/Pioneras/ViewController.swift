//
//  ViewController.swift
//  Pioneras
//
//  Created by Manuel Gómez Cámara on 1/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func retornoDeSecundaria(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc2 = segue.destination as? SecundarioViewController {
            vc2.nombreAsset = segue.identifier! + "_bio"
        }
    }


}

