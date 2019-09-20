//
//  ListPokemonTableViewController.swift
//  Tablas
//
//  Created by juan kuga on 9/16/19.
//  Copyright © 2019 Juan Kuga. All rights reserved.
//

import UIKit

class ListPokemonTableViewController: UITableViewController {
    
    @IBOutlet var tableview: UITableView!
    var pokemons = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let picachu = ["name" : "picachu", "tipo" : "Electrico"]
        pokemons.append(picachu)
        
        let charmander = ["name" : "Charmander", "tipo" : "Fuego"]
        pokemons.append(charmander)
        print(pokemons)

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonCellTableViewCell
        let pokemon = pokemons[indexPath.row]
        
        cell.nombre.text = pokemon["name"]
        cell.tipo.text = pokemon["tipo"]
        
        
//        cell.textLabel?.text = pokemon["name"]
//        cell.detailTextLabel?.text = pokemon["tipo"]

        return cell
    }

   
}
