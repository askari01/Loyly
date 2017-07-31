//
//  FormViewController.swift
//  Loyly
//
//  Created by Syed Askari on 7/29/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, GameBoardUIViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var height1: NSLayoutConstraint!
    @IBOutlet weak var height2: NSLayoutConstraint!
    
    @IBOutlet var gameBoardUIView: CellV!
    
    @IBOutlet weak var ingredientField: UITextField!
    
    
    var ingredientCount: Int = 0
//    let GetData: GetDataDelegate as? Cell
    var ingredient: String?
    
    var abc = CellV()
    var abc1 = [UIView?](repeating: CellV(), count: 64)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print (stackView.arrangedSubviews.count)
        var cell = abc.loadViewFromNib()
        abc.delegate = self
        
        //testing
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.numberOfTapsRequired = 1
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // tap
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Delegte protocol method
    func checkIfNextMoveExistsForGameBoardUIView(gameBoardUIView: CellV, text: String) {
        gameBoardUIView.delegate = self
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {(action: UIAlertAction!) in
            print("Game Over")
            self.ingredient?.append("\n")
            self.ingredient?.append(String(describing:(self.ingredientCount + 1)))
            self.ingredient?.append(text)
            print(self.ingredient)
//            print(self.abc1[0].text.text)
        }))
        
        // If you need to feed back to the game view you can do it in the completion block here
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @IBAction func ingredientButton(_ sender: UIButton) {
        ingredientCount += 1
        print (ingredientCount)
        
        // saving array of views
        abc1[ingredientCount] = abc.loadViewFromNib()
        
        // sving text
        if ingredientField.text != nil && ingredientCount == 1 {
            ingredient = String(describing:ingredientCount) + ingredientField.text!
        }
//        abc.text.text = "boo: \(ingredientCount)"
//        abc.text.tag = 7 + ingredientCount
//        if let abc1 = abc.text.text {
//            print ("non: \(abc1)")
//            print ("ji: \(abc.text.tag)")
//        }
//        
        // colour
//       cell.backgroundColor = UIColor.orange
        abc.view.backgroundColor = UIColor.orange
        abc.view1.backgroundColor = UIColor.orange
        abc.text.delegate = self
        var cell = abc.loadViewFromNib()
        if cell != nil {
            stackView.insertArrangedSubview(cell, at: (7 + ingredientCount))
            // removing
//            stackView.removeArrangedSubview(cell)
            height1.constant = height1.constant + CGFloat(41)
            height2.constant = height2.constant + CGFloat(41)
    
        }
    }
    
    func printText(text: String) {
        print("papap: \(text)")
    }
    
    // testing
    // UITextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

}

