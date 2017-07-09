//
//  OilDetailVC.swift
//  Loyly
//
//  Created by Syed Askari on 7/9/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class OilDetailVC: UIViewController {
    
    var oil: Oils!
    
    @IBOutlet weak var bannerOil: UIImageView!
    @IBOutlet weak var nameOil: UILabel!
    @IBOutlet weak var familyOil: UILabel!
    @IBOutlet weak var originOil: UILabel!
    @IBOutlet weak var strengthOil: UILabel!
    @IBOutlet weak var noteOil: UILabel!
    @IBOutlet weak var fragranceGroup: UILabel!
    @IBOutlet weak var extractionMethod: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameOil.text = oil.name.capitalized
        bannerOil.image = UIImage(named: oil.name)
        familyOil.text = oil.plantFamily
        originOil.text = oil.origin
        noteOil.text = oil.note
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
