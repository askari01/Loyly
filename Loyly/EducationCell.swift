//
//  EducationCellTableViewCell.swift
//  Loyly
//
//  Created by Syed Askari on 8/23/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class EducationCell: UITableViewCell {
    @IBOutlet weak var level1: UILabel!
    @IBOutlet weak var picture1: UIImageView!
    @IBOutlet weak var flanguage1: UILabel!
    @IBOutlet weak var wearDate1: UILabel!
    
    var education: Education!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValues(level: String, flanguage: String, wearDate: String, picture1: URL ) {
        self.picture1.kf.indicatorType = .activity
        self.picture1.kf.setImage(with: picture1)
        self.level1.text = level.capitalized
        self.flanguage1.text = flanguage
        self.wearDate1.text = wearDate
    }

}
