//
//  ViewController.swift
//  pokedex
//
//  Created by juan kuga on 9/24/19.
//  Copyright © 2019 Juan Kuga. All rights reserved.
//

import UIKit
import Alamofire

struct Pokemon : Decodable {
    let name : String
    let url : String
}

class ViewController: UIViewController {

    var pokemons = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokemonJSON()
        
        
//        fetchPokemonJSON { (pokemons, err) in
//            if let err = err {
//                print("error", err)
//                return
//            }
//
//            pokemons?.forEach({ (pokemon) in
//                print(pokemon)
//            })
//        }
    }
    
//    public func fetchAllPokemons(limit: Int,
//                                 offset: Int,
//                                 completion: @escaping (_ success:Bool, _ pokemons:[Pokemon]?, _ error:Error?) -> Swift.Void) {
//        var pokemons = [Pokemon]()
//        let urlWithPagination = "\(URL_BASE_POKEMONS)?limit=\(String(limit))&offset=\(String(offset))"
//        NetworkingManager.shared.request(toUrl: urlWithPagination, parameters: nil, method: .get, encoding: URLEncoding.default) { (sucess, response, error) in
//            if sucess {
//                guard let response = response as? [String:Any] else {
//                    completion(false, nil, error)
//                    return
//                }
//
//                let results = response["results"] as? [[String:Any]]
//
//                if let results = results {
//                    for item in results {
//                        let url = item["url"] as! String
//                        let name = item["name"] as! String
//
//                        let splitUrl = url.components(separatedBy: "/")
//                        let id = splitUrl[splitUrl.count - 2]
//                        let image = "\(URL_IMAGEN_POKEMON)\(id).png"
//
//                        let pokemon = Pokemon.init(id: Int(id)!, name: name, image: image, url: url)
//                        pokemons.append(pokemon)
//                    }
//                    completion(true, pokemons, error)
//                } else {
//                    completion(false, nil, error)
//                }
//            } else {
//                completion(false, nil, error)
//            }
//        }
//    }
    
 
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
            }
        }
    }
    
    fileprivate func fetchPokemonJSON_bk(completion : @escaping ([Pokemon]?, Error?) -> ()) {
        
        let urlString = "https://pokeapi.co/api/v2/pokemon/"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(nil, err)
            }
            
            
            do{
                let pokemons = try JSONDecoder().decode([Pokemon].self, from: data!)
                completion(pokemons, nil)
                
            } catch let jsonError {
                completion(nil, jsonError)
            }
            
            
        }.resume()
        
        
    }


}

