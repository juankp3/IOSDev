//
//  SideBarViewController.swift
//  SideMenu
//
//  Created by juan kuga on 9/20/19.
//  Copyright © 2019 Juan Kuga. All rights reserved.
//

import UIKit

class SideBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   

    @IBOutlet weak var tableview: UITableView!
    var menu = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let micuenta = ["name" : "Mi Cuenta", "icon" : "iconasdf"]
        menu.append(micuenta)
        
        let nosotros = ["name" : "Nosotros", "icon" : "iconasdf"]
        menu.append(nosotros)
        
        let ayuda = ["name" : "Ayuda", "icon" : "iconasdf"]
        menu.append(ayuda)
        
        

        // Do any additional setup after loading the view.
    }
    
     // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menu.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableViewCell
        let texto = menu[indexPath.row]
        
        cell.lblname.text = texto["name"]
        
        return cell
//         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


