//
//  DelegateTabla.swift
//  EjercicioTablas
//
//  Created by Manuel Gómez Cámara on 1/11/23.
//

import UIKit

class DelegateTabla : NSObject, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        if let celda = tableView.cellForRow(at: indexPath){
            if (celda.textLabel?.textColor == UIColor.red)
            {
                celda.textLabel?.textColor = UIColor.black
            }else
            {
                celda.textLabel?.textColor = UIColor.red
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
