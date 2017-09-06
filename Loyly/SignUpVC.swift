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
import GradientLoadingBar


class SignUpVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var wellness: UITextField!
    @IBOutlet weak var postalCode: UITextField!
    
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var address: UITextField!
    
    var json: JSON!
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

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    @IBAction func signUpAction(_ sender: UIButton) {
        if (email.text != "" && name.text != "" && password1.text != "" && password2.text != "" && postalCode.text != "" && wellness.text != "" && city.text != "" && country.text != "" && address.text != "" && password1.text == password2.text) {
            loadingBar.show()
            var check = signUp(name: name.text!, user: email.text!, pass: password1.text!, postal: postalCode.text!, phone: phoneNo.text!, city: city.text! , country: country.text!, address: address.text!, wellness: wellness.text! )
            if check {
                performSegue(withIdentifier: "SignIn", sender: self)
            } else {
//                email.shake()
//                email.text = ""
//                name.shake()
//                name.text = ""
//                password1.shake()
//                password1.text = ""
//                password2.shake()
//                password2.text = ""
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                imageView.isHidden = true
                self.view.frame.origin.y -= 120
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                imageView.isHidden = false
                self.view.frame.origin.y += 120
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
    
    func signUp(name: String, user: String, pass: String, postal: String , phone: String, city: String, country: String, address: String, wellness: String) -> Bool {
        let parameters: Parameters = [
            "name": name,
            "email": user,
            "password": pass,
            "city": city,
            "country": country,
            "wellness": wellness,
            "address": address,
            "phoneno": phoneNo,
            "lastname": name,
            "postcode": postalCode
        ]
        
//        print(parameters)
        
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
                        
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {action in
                            self.email.shake()
                            self.email.text = ""
                            self.name.shake()
                            self.name.text = ""
                            self.password1.shake()
                            self.password1.text = ""
                            self.password2.shake()
                            self.password2.text = ""
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
