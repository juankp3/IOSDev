//
//  ViewController.swift
//  SideMenu
//
//  Created by juan kuga on 9/20/19.
//  Copyright © 2019 Juan Kuga. All rights reserved.
//

import UIKit
import FontAwesome_swift
//import SideMenuSwift

class ViewController: UIViewController {

    @IBOutlet weak var lblmenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        lblmenu.image = UIImage.fontAwesomeIcon(name: .github, style: .brands, textColor: .black, size: CGSize(width: 4000, height: 4000))
        lblmenu.image = UIImage.fontAwesomeIcon(name: .bars, style: .solid, textColor: .black, size: CGSize(width: 45, height: 45))
    }
    
    //    self.sideMenuController?.revealMenu()
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    @IBAction func OpenMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    
}

