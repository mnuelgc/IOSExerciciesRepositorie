//
//  ViewController.swift
//  EjercicioTablas
//
//  Created by Raquel Guerrero Perucho on 1/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFIeld: UITextField!
    @IBOutlet weak var table: UITableView!
    
    var tableDataSource : DSTabla!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableDataSource = DSTabla()
        
        self.table.dataSource = tableDataSource
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddName(_ sender: Any) {
        if let textInBox = textFIeld.text {
            if (textInBox != ""){
                tableDataSource.lista.append(textInBox)
                
                let indPath = IndexPath(row: tableDataSource.lista.count - 1, section: 0)
                table.insertRows(at: [indPath], with: UITableView.RowAnimation.bottom)
            }
        }
    }
}

