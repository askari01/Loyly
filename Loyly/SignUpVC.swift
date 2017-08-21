//
//  SignUpVC.swift
//  Loyly
//
//  Created by Syed Askari on 8/16/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    
    var json: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpAction(_ sender: UIButton) {
        if email.text != "" && name.text != "" && password1.text != "" && password2.text != "" && password1.text == password2.text {
            var check = signUp(name: name.text!, user: email.text!, pass: password1.text!)
            if check {
                performSegue(withIdentifier: "SignIn", sender: self)
            } else {
                email.shake()
                email.text = ""
                name.shake()
                name.text = ""
                password1.shake()
                password1.text = ""
                password2.shake()
                password2.text = ""
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signUp(name: String, user: String, pass: String) -> Bool {
        let parameters: Parameters = [
            "name": name,
            "email": user,
            "password": pass
        ]
        
        print(parameters)
        
        Alamofire.request("http://swatshawls.com/loyly/Users/signup", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil ).responseJSON{ response in
            switch response.result {
            case .success:
                print("0: \(response)")
                if let value = response.result.value {
                    self.json = JSON(value)
                    print("1: \(self.json)")
                    print( "2: \(self.json["response"])")
                    if self.json["response"] == "User Registered Successfully" {
                        self.performSegue(withIdentifier: "SignIn", sender: self)
                    } else {
                        // create the alert
                        let alert = UIAlertController(title: "Response", message: "Not Successful", preferredStyle: UIAlertControllerStyle.alert)
                        
                        
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
