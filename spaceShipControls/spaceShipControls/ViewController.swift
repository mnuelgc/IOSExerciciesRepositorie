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
    
    
    let multichoice = UIAlertController(
        title: "¡¡¡Emergencia!!!",
        message: "Necesitamos una solución",
        preferredStyle: .actionSheet)
    
    let naveSalvavidas = UIAlertAction(
        title: "Lanzar nave salvavidas", style: .default){
            action in
            print("Nave salvavidas lanzada")
        }
    
    let hiperespacio = UIAlertAction(
        title: "Saltar al hiperespacio", style: .default){
            action in
            print("Saltando al hiperespacio")
        }
    
    let autodestruccion = UIAlertAction(
        title: "Autodestrucción", style: .destructive){
            action in
            print("Comenzando la cuenta atrás...")
        }
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        sliderValue.text = String(Int(slider.value))
        
        multichoice.addAction(naveSalvavidas)
        multichoice.addAction(hiperespacio)
        multichoice.addAction(autodestruccion)
        
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
    
    
    @IBAction func emergencyCall(_ sender: UIButton) {
        self.present(multichoice, animated: true)
    }
    

    
}

