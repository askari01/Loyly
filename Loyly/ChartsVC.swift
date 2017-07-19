//
//  ChartsVC.swift
//  Loyly
//
//  Created by Syed Askari on 7/11/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class ChartsVC: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    var choice: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        image1.tag = 1
        image2.tag = 2
        image3.tag = 3
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(click))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(click))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(click))
        tap1.numberOfTapsRequired = 1
        tap2.numberOfTapsRequired = 1
        tap3.numberOfTapsRequired = 1
        image1.addGestureRecognizer(tap1)
        image2.addGestureRecognizer(tap2)
        image3.addGestureRecognizer(tap3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func click(gesture: UIGestureRecognizer) {
//        print("GESTURE TAG: ",gesture.view?.tag)
        choice = Int((gesture.view?.tag)!)
        performSegue(withIdentifier: "chart", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chart" {
            if let chartDetails = segue.destination as? ChartVC {
                chartDetails.choice = String(describing: choice!)
            }
        }
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
