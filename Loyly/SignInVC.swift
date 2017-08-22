//
//  SignInVC.swift
//  Loyly
//
//  Created by Syed Askari on 8/16/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation
import GradientLoadingBar

class SignInVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var json: JSON!
    let pref = UserDefaults()
    
    let loadingBar = GradientLoadingBar(
        height: 3.0,
        durations: Durations(fadeIn: 1.0, fadeOut: 2.0, progress: 3.0),
        gradientColors: [
            UIColor(hexString:"#4cd964").cgColor,
            UIColor(hexString:"#ff2d55").cgColor
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        email.delegate = self
//        password.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if email.text != "" && password.text != "" {
            loadingBar.show()
            var check = login(user: email.text!, pass: password.text!)
            if check {
                performSegue(withIdentifier: "loggedIn", sender: self)
            } else {
//                email.shake()
//                email.text = ""
//                password.shake()
//                password.text = ""
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func login(user: String, pass: String) -> Bool {
        let parameters: Parameters = [
            "email": user ,
            "password": pass
        ]
        
        print(parameters)
        
        Alamofire.request("http://swatshawls.com/loyly/Users/signin", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil ).responseJSON{ response in
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
                    if self.json["response"] != "Authentication Failed" {
                        var id = self.json["response"]["id"].string!
                        print (id)
                        self.pref.set("\(id)", forKey: "id")
                        self.performSegue(withIdentifier: "loggedIn", sender: self)
                    } else {
                        // create the alert
                        let alert = UIAlertController(title: "Response", message: self.json["response"].string, preferredStyle: UIAlertControllerStyle.alert)

                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {
                            action in
                            self.email.shake()
                            self.email.text = ""
                            self.password.shake()
                            self.password.text = ""
                        }))

                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                    }
                    self.loadingBar.hide()
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
