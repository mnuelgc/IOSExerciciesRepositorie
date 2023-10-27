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
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sliderValue: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        sliderValue.text = String(Int(slider.value))
        
        
    }

    
    @IBAction func introPressed(_ sender: UITextField) {
        
        if let texto = editTextObject.text{
            if (texto != ""){
                text.text += texto + "\n"
            }
        }

        sender.resignFirstResponder()

    }
    
    @IBAction func onSliderChangeValue(_ sender: UISlider) {
        sliderValue.text = String(Int(slider.value))
    }
    
    
}

