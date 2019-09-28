//
//  ListTableViewController.swift
//  pokedex
//
//  Created by juan kuga on 9/25/19.
//  Copyright © 2019 Juan Kuga. All rights reserved.
//

import UIKit
import Alamofire

class ListTableViewController: UITableViewController {

    @IBOutlet var tableview: UITableView!
    var pokemons = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPokemonJSON()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = pokemon["name"]
        
        return cell
    }
    
    fileprivate func fetchPokemonJSON() {
        AF.request("https://pokeapi.co/api/v2/pokemon/").responseJSON { response in
            guard let response = response.value as? [String:Any] else { return }
            
            let results = response["results"] as? [[String:Any]]
            if let results = results {
                for item in results {
                    
                    guard let pokemonName = item["name"] else {
                        print("You didn't provide a name!")
                        return
                    }
                    
                    let pokemon = ["name" : pokemonName]
                    self.pokemons.append(pokemon as! [String : String])
                    
                }
                
                print(self.pokemons)
                self.tableView.reloadData()
            }
        }
        
    }

   
}
