//
//  CellV.swift
//  Loyly
//
//  Created by Syed Askari on 7/29/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

// Delegate protocol declared here
protocol GameBoardUIViewDelegate: class {
    func checkIfNextMoveExistsForGameBoardUIView(gameBoardUIView: CellV, text: String)
}

class CellV: UIView, UITextFieldDelegate {
    @IBOutlet var view: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //
    private var currentTextField: UITextField?
    
    // GameBoardUIView has a delegate property that conforms to the protocol
    // weak to prevent retain cycles
    weak var delegate:GameBoardUIViewDelegate?
   
    override init(frame: CGRect) {
        super.init(frame: frame)
//        text.delegate = self
        comonInit()
    }
    
    override func awakeFromNib() {
        text.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        comonInit()
    }
    
    func comonInit() {
        UINib(nibName: "CellV", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        text.delegate = self
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CellV", bundle: bundle)
        let view1 = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view1
    }
    
    func getText() -> String {
        if text.text != nil {
            return text.text!
        }
        return "hi"
    }
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
//        print("button clicked")
        var abc = getText()
        text.text = ""
        delegate?.checkIfNextMoveExistsForGameBoardUIView(gameBoardUIView: self, text: abc)
//        print (abc)
    }
    
    // UITextField Delegates
    // UITextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print(textField.text!)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print(textField.text!)
        if textField.text == "" {
            view.shake()
            progressBar.isHidden = false
        } else {
            progressBar.isHidden = true
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print(textField.text!)
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        print(textField.text!)
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        print(textField.text!)
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(textField.text!)
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
//        print(textField.text!)
        return true;
    }
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-7.0, 7.0, -7.0, 7.0, -5.0, 5.0, -2.0, 2.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
