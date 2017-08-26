//
//  OilCell.swift
//  Loyly
//
//  Created by Syed Askari on 7/9/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class OilCell: UITableViewCell {
    @IBOutlet weak var bannerOil: UIImageView!
    @IBOutlet weak var nameOil: UILabel!
    @IBOutlet weak var botanicalNameOil: UILabel!
    
    var oil: Oils!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ oil: Oils) {
        self.oil = oil
        nameOil.text = self.oil.name.capitalized
        bannerOil.image = UIImage(named: self.oil.name)
        bannerOil.layer.cornerRadius = 5
        botanicalNameOil.text = self.oil.botanicalName
    }
}
