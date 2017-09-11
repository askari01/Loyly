//
//  ContactVC.swift
//  Loyly
//
//  Created by Syed Askari on 9/6/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func emailAction(_ sender: UIButton) {
        let email = "info@aromen.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func callAction(_ sender: UIButton) {
        if let url = URL(string: "tel://\(0032471676573 as Int64)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func openFB(_ sender: UIButton) {
        let Username =  "loylymasters" // Your Instagram Username here
        let appURL = NSURL(string: "fb://user?username=\(Username)")!
        let webURL = NSURL(string: "https://fb.com/\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    @IBAction func openSkype(_ sender: UIButton) {
        var skype: NSURL = NSURL(string: String(format: "skype:"))! //add object skype like this
        if UIApplication.shared.canOpenURL(skype as URL) {
            UIApplication.shared.open(skype as URL)
        }
        else {
            // skype not Installed in your Device
            let installed = UIApplication.shared.canOpenURL(NSURL(string: "skype:")! as URL)
            if installed {
                UIApplication.shared.openURL(NSURL(string: "skype:mvanhoorelbeke?call")! as URL)
                
            } else {
                
                UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/in/app/skype/id304878510?mt=8")! as URL)
            }
        }
    }
    
    @IBAction func openInstagram(_ sender: UIButton) {
        let Username =  "loylymasters" // Your Instagram Username here
        let appURL = NSURL(string: "instagram://user?username=\(Username)")!
        let webURL = NSURL(string: "https://instagram.com/\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
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
