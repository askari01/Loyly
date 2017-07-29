//
//  FormViewController.swift
//  Loyly
//
//  Created by Syed Askari on 7/29/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var height1: NSLayoutConstraint!

    var abc = CellV()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print (stackView.arrangedSubviews.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var cell = abc.loadViewFromNib()
        if cell != nil {
//            stackView.addSubview(cell)
            stackView.insertArrangedSubview(cell, at: 18)
            print(height1.constant)
            height1.constant = height1.constant + CGFloat(41)
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
