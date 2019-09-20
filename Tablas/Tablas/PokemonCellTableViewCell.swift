//
//  PokemonCellTableViewCell.swift
//  Tablas
//
//  Created by juan kuga on 9/16/19.
//  Copyright © 2019 Juan Kuga. All rights reserved.
//

import UIKit

class PokemonCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var tipo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
