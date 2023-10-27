//
//  GestorPicker.swift
//  spaceShipControls
//
//  Created by Máster Móviles on 27/10/23.
//

import UIKit

class GestorPicker : NSObject, UIPickerViewDelegate, UIPickerViewDataSource{
    let worlds = ["Roshar", "Scadrial", "Sel", "Cántico", "Treno", "Taldain", "Lumar", "Komashi"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return worlds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)->String?{
        return worlds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            print("Viajando a: \(worlds[row])")
        }
}
