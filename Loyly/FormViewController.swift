//
//  FormViewController.swift
//  Loyly
//
//  Created by Syed Askari on 7/29/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, GameBoardUIViewDelegate {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var height1: NSLayoutConstraint!
    @IBOutlet weak var height2: NSLayoutConstraint!
    
    @IBOutlet var gameBoardUIView: CellV!
    
    var ingredientCount: Int = 0
//    let GetData: GetDataDelegate as? Cell
    
    var abc = CellV()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print (stackView.arrangedSubviews.count)
        var cell = abc.loadViewFromNib()
//        if cell != nil {
//            stackView.insertArrangedSubview(cell, at: (8 + ingredientCount))
//            height1.constant = height1.constant + CGFloat(41)
//            height2.constant = height2.constant + CGFloat(41)
//        }
        abc.delegate = self
    }
    
    // Delegte protocol method
    func checkIfNextMoveExistsForGameBoardUIView(gameBoardUIView: CellV, text: String) {
        gameBoardUIView.delegate = self
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {(action: UIAlertAction!) in
            print("Game Over")
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
        
//        var cell = abc.loadViewFromNib()
//        if cell != nil {
////            stackView.addSubview(cell)
//            stackView.insertArrangedSubview(cell, at: 18)
//            print(height1.constant)
//            height1.constant = height1.constant + CGFloat(41)
//        }
    }

    @IBAction func ingredientButton(_ sender: UIButton) {
        ingredientCount += 1
        print (ingredientCount)
        abc.text.text = "boo: \(ingredientCount)"
        abc.text.tag = 8 + ingredientCount
        if let abc1 = abc.text.text {
            print ("non: \(abc1)")
            print ("ji: \(abc.text.tag)")
        }
        var cell = abc.loadViewFromNib()
        if cell != nil {
            stackView.insertArrangedSubview(cell, at: (8 + ingredientCount))
//            stackView.removeArrangedSubview(cell)
            height1.constant = height1.constant + CGFloat(41)
            height2.constant = height2.constant + CGFloat(41)
        }
    }
    
    func printText(text: String) {
        print("papap: \(text)")
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

