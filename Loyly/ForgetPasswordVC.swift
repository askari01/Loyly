//
//  ForgetPasswordVC.swift
//  Loyly
//
//  Created by Syed Askari on 8/16/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ForgetPasswordVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    var json: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgetAction(_ sender: UIButton) {
        if email.text != "" {
            var check = forget(user: email.text!)
            if check {
                performSegue(withIdentifier: "forgetPassword", sender: self)
            } else {
                email.shake()
                email.text = ""
            }
        }
    }
    
    func forget(user: String) -> Bool {
        let parameters: Parameters = [
            "email": user
        ]
        
        print(parameters)
        
        Alamofire.request("http://swatshawls.com/loyly/Users/forgot", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil ).responseJSON{ response in
            print(response.request as Any)  // original URL request
            print(response.response as Any) // URL response
            print(response.result.value as Any)   // result of response serialization
            
            switch response.result {
            case .success:
                print("0: \(response)")
                if let value = response.result.value {
                    self.json = JSON(value)
                    print("1: \(self.json)")
                    print( "2: \(self.json["response"])")
                    if self.json["response"] == "Verification code is sent to you via email." {
                        self.performSegue(withIdentifier: "forgetPassword", sender: self)
                    } else {
                        // create the alert
                        let alert = UIAlertController(title: "Response", message: self.json["response"].string, preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                break
            case .failure(let error):
                print(error)
            }
        }
        return false
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
