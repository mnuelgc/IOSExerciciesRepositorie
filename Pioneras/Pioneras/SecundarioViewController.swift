//
//  SecundarioViewController.swift
//  Pioneras
//
//  Created by Manuel Gómez Cámara  on 1/11/23.
//

import UIKit

class SecundarioViewController: UIViewController {

    var nombreAsset : String = ""
    
  
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var texto = ""
        let asset = NSDataAsset(name: nombreAsset)
        
        if let data = asset?.data{
            texto = String(data: data, encoding: .utf8) ?? ""
            self.textField.text = texto
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
