//
//  DSTabla.swift
//  EjercicioTablas
//
//  Created by Manuel Gómez Cámara  1/11/23.
//

import UIKit


class DSTabla : NSObject, UITableViewDataSource{
    
    var lista = ["Kaladin Bendito por la Tormenta", "Shallan Davar", "Dalinar Kholin", "Adolin Kholin", "Szeth hijo-Neturo", "Sigzil", "Roca", "Teft", "El Lopen" ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: .default, reuseIdentifier:"cellIdentify")
        celda.textLabel?.text = "\(lista[indexPath.row])"
        celda.textLabel?.textColor = UIColor.black
        return celda
    }
    
    
}

