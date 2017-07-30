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

class CellV: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var text: UITextField!
    
    // GameBoardUIView has a delegate property that conforms to the protocol
    // weak to prevent retain cycles
    weak var delegate:GameBoardUIViewDelegate?
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "CellV", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
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
        print("button clicked")
        var abc = getText()
        delegate?.checkIfNextMoveExistsForGameBoardUIView(gameBoardUIView: self, text: abc)
        print (abc)
    }
    
}
