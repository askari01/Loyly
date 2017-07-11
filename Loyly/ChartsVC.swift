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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        image1.tag = 1
        image2.tag = 2
        image3.tag = 3
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(click))
        tap.numberOfTapsRequired = 1
        image1.addGestureRecognizer(tap)
        image2.addGestureRecognizer(tap)
        image3.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func click(gesture: UIGestureRecognizer) {
        print("GESTURE TAG: ",gesture.view?.tag)
        performSegue(withIdentifier: "chart", sender: self)
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
