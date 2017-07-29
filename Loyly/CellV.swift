//
//  CellV.swift
//  Loyly
//
//  Created by Syed Askari on 7/29/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class CellV: UIView {
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "CellV", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
    }
    
    private func comonInit() {
        Bundle.main.loadNibNamed("CellV", owner: self, options: nil)
        guard let content = view else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CellV", bundle: bundle)
        let view1 = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view1
//        return UINib(nibName: "CellV", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        
    }
    
}
