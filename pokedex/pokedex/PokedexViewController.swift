//
//  PokedexViewController.swift
//  pokedex
//
//  Created by juan kuga on 9/26/19.
//  Copyright © 2019 Juan Kuga. All rights reserved.
//

import UIKit
import Alamofire

class PokedexViewController: UIViewController {
    
    @IBOutlet weak var mPokemonName: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var pokemons = [[String:Any]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokemons {
            print("hola")
        }
        self.tableview.reloadData()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    public func fetchImagePokemon(cont : Int) -> UIImage {
        var image = UIImage()
        let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/\(String(describing: cont)).png"
        AF.download(imageUrl).responseData { response in
            if let data = response.value {
                image = UIImage(data: data)!
            }
        }
        
        return image
    }
    
    public func fetchPokemons(completed:()->()) {
    
        AF.request("https://pokeapi.co/api/v2/pokemon/").responseJSON { response in
            guard let response = response.value as? [String:Any] else { return }
            let results = response["results"] as? [[String:Any]]
            
            if let results = results {
                var cont = 0
                for item in results {
                    cont = cont + 1
                    guard let pokemonName = item["name"] else {
                        print("You didn't provide a name!")
                        return
                    }
                    
                    let img = self.fetchImagePokemon(cont: cont)
                    
                    let pokemon = ["id" : "\(cont)", "name" : pokemonName, "image" : img]
                    self.pokemons.append(pokemon)
                }
               
                
            }
            self.tableview.reloadData()

        }
        completed()
            
    }
    
}

extension PokedexViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        
        cell.pokemonName.text = pokemon["name"] as? String
        cell.pokemonImage.image = (pokemon["image"] as! UIImage)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        
        self.mPokemonName.text = pokemon["name"]! as? String
        self.tableview.reloadData()
    }
    
    
}
