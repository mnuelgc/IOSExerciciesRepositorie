//
//  ListController.swift
//  Marvel
//
//  Created by Máster Móviles on 3/11/23.
//

import UIKit
import Marvelous

class ListController: UIViewController, UISearchResultsUpdating, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "tableCell")
        cell.textLabel?.text = self.results[indexPath.row].name
        return cell
    }
    
    @IBOutlet weak var table: UITableView!
    
    let throttler = Throttler(minimumDelay: 0.5)
    
    var searchController : UISearchController!
    
    var results : [RCCharacterObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
            
        self.searchController.searchBar.sizeToFit()
        self.table.tableHeaderView = searchController.searchBar
        
        self.table.dataSource = self
    }
    

    func updateSearchResults(for searchController : UISearchController){
        throttler.throttle {
            let searchedText = searchController.searchBar.text!
            //remove white characters
            
            let searchedTextTrim = searchedText.trimmingCharacters(in: .whitespacesAndNewlines)
            self.mostrarPersonajes(comienzanPor: searchedTextTrim)
        }
    }
    
    func mostrarPersonajes(comienzanPor cadena : String) {
        self.results.removeAll()
        if cadena.count > 2{
            let marvelAPI = RCMarvelAPI()
            //PUEDES CAMBIAR ESTO PARA PONER TUS CLAVES
            marvelAPI.publicKey = "9f21850b7afb93929bb2f044d2d1f661"
            marvelAPI.privateKey = "59c50fcb3b22a4e64ed4827aeeb949d323fe67f0"
            let filtro = RCCharacterFilter()
            filtro.nameStartsWith = cadena
            filtro.limit = 50
            marvelAPI.characters(by: filtro) {
                resultados, info, error in
                if let personajes = resultados as? [RCCharacterObject] {
                    for personaje in personajes {
                        self.results.append(personaje)
                        print(personaje.name ?? "")
                        
                        OperationQueue.main.addOperation() {
                            self.table.reloadData();
                        }
                    }
                    print("Hay \(personajes.count) personajes")
                }
            }
        }
    }
}
