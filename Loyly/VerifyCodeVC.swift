//
//  VerifyCodeVC.swift
//  Loyly
//
//  Created by Syed Askari on 8/16/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class VerifyCodeVC: UIViewController {
    @IBOutlet weak var code: UITextField!
    
    var json: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verifyAction(_ sender: UIButton) {
        if code.text != "" {
            var check = verify(code: code.text!)
            if check {
                performSegue(withIdentifier: "setNewPassword", sender: self)
            } else {
                code.shake()
                code.text = ""
            }
        }
    }
    
    func verify(code: String) -> Bool {
        let parameters: Parameters = [
            "code": code
        ]
        
        print(parameters)
        
        Alamofire.request("http://swatshawls.com/loyly/Users/CheckCode", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil ).responseJSON{ response in
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
                    if self.json["response"] == "verified" {
                        self.performSegue(withIdentifier: "setNewPassword", sender: self)
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
