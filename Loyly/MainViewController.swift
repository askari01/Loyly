//
//  MainViewController.swift
//  Loyly
//
//  Created by Syed Askari on 8/22/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let pref = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        pref.set("", forKey: "id")
        performSegue(withIdentifier: "logOut", sender: self)
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
