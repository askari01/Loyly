//
//  AgfussCell.swift
//  Loyly
//
//  Created by Syed Askari on 8/5/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class AgfussCell: UITableViewCell {
    @IBOutlet weak var picture1: UIImageView!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var tag1: UILabel!
    @IBOutlet weak var time1: UILabel!

    
    var agfuss: Agfuss!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ agfuss: Agfuss) {
        // to do
        self.agfuss = agfuss
        self.picture1.image = UIImage(named: self.agfuss.title)
        self.title1.text = self.agfuss.title.capitalized
        self.tag1.text = self.agfuss.tag
        self.time1.text = self.agfuss.time
    }
    
    func setValues(title: String, tag: String, time1: String, picture1: URL ) {
        self.picture1.kf.setImage(with: picture1)
        self.title1.text = title.capitalized
        self.tag1.text = tag
        self.time1.text = time1
    }

}
