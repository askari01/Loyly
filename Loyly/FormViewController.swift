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
    
    // Title
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleField: UITextField!
    
    // Tags
    @IBOutlet weak var tags: UISegmentedControl!
    
    //Time
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var timeView: UIView!
    
    // Ingredient
    @IBOutlet weak var ingredientField: UITextField!
    @IBOutlet weak var ingredientProgress: UIProgressView!
    @IBOutlet weak var ingredientView: UIView!
    @IBOutlet weak var ingredientButton: UIButton!
    
    // Instructions
    @IBOutlet weak var instructionField: UITextField!
    @IBOutlet weak var instructionProgress: UIProgressView!
    @IBOutlet weak var instructionView: UIView!
    @IBOutlet weak var instructionButton: UIButton!

    
    // Steps
    @IBOutlet weak var stepField: UITextField!
    @IBOutlet weak var stepProgress: UIProgressView!
    @IBOutlet weak var stepView: UIView!
    @IBOutlet weak var stepButton: UIButton!
    
    // Image
    @IBOutlet weak var image: UIImageView!
    
    // Add Image
    @IBOutlet weak var saveAll: UIButton!
    
    // Ingredient Handler
    var ingredientCount: Int = 0
    var ingredient: String?
    
    var ingredientCollection = [CellV?](repeating: CellV(), count: 64)
    var ingredientCollections = [CellV]()
    
    // Instruction Handler
    var instructionCount: Int = 0
    var instruction: String?
    
    var instructionCollection = [CellV?](repeating: CellV(), count: 64)
    var instructionCollections = [CellV]()
    
    // Step Handler
    var stepCount: Int = 0
    var step: String?
    
    var stepCollection = [CellV?](repeating: CellV(), count: 64)
    var stepCollections = [CellV]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print (stackView.arrangedSubviews.count)
        ingredientCollection[ingredientCount]?.delegate = self
        instructionCollection[instructionCount]?.delegate = self
        stepCollection[stepCount]?.delegate = self
        
        //testing
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.numberOfTapsRequired = 1
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        ingredientField.delegate = self
        view.addGestureRecognizer(tap)
        
        // buttons set
        ingredientButton.imageView?.contentMode = .scaleAspectFit
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
        if ingredientField.text == "" {
            ingredientView.shake()
            ingredientProgress.isHidden = false
        }
        else {
            ingredientProgress.isHidden = true
            ingredientCount += 1
            print ("The Count is: \(ingredientCount)")
            let a = CellV()
            ingredientCollections.insert(a, at: (ingredientCount - 1))

            
            ingredientCollections[ingredientCount - 1].text.delegate = self
            var cell = ingredientCollections[ingredientCount - 1].loadViewFromNib()
            
            // Colour
            // view bar
            ingredientCollections[ingredientCount - 1].view.backgroundColor = UIColor.init(red: 252/255.0, green: 107/255.0, blue: 52/255.0, alpha: 1)
            ingredientCollections[ingredientCount - 1].view1.backgroundColor = UIColor.init(red: 252/255.0, green: 107/255.0, blue: 52/255.0, alpha: 1)
            // progress bar
            ingredientCollections[ingredientCount - 1].progressBar.tintColor = UIColor.red
            // title number
            ingredientCollections[ingredientCount - 1].number.text = String(describing: (ingredientCount + 1))
            // place holder
            ingredientCollections[ingredientCount - 1].text.placeholder = "Ingredient " +
            (ingredientCollections[ingredientCount - 1].number.text)!
            // aspect fit
            ingredientCollections[ingredientCount - 1].button.imageView?.contentMode = .scaleAspectFit
            
            
            if cell != nil {
                print("tag: \(cell.tag)")
                stackView.insertArrangedSubview(cell, at: (7 + ingredientCount))
                
                // adjusting height of constraints
                height1.constant = height1.constant + CGFloat(41)
                height2.constant = height2.constant + CGFloat(41)
                
                // removing
                //            stackView.removeArrangedSubview(cell)
            }
        }
    }
    
    
    @IBAction func instructionButton(_ sender: UIButton) {
        if instructionField.text == "" {
            instructionView.shake()
            instructionProgress.isHidden = false
        }
        else {
            instructionProgress.isHidden = true
            instructionCount += 1
            print ("The Count is: \(instructionCount)")
            let a = CellV()
            instructionCollections.insert(a, at: (instructionCount - 1))
            
            
            instructionCollections[instructionCount - 1].text.delegate = self
            var cell = instructionCollections[instructionCount - 1].loadViewFromNib()
            
            // Colour
            // view bar
            instructionCollections[instructionCount - 1].view.backgroundColor = UIColor.init(red: 163/255.0, green: 184/255.0, blue: 58/255.0, alpha: 1)
            instructionCollections[instructionCount - 1].view1.backgroundColor = UIColor.init(red: 163/255.0, green: 184/255.0, blue: 58/255.0, alpha: 1)
            // progress bar
            instructionCollections[instructionCount - 1].progressBar.tintColor = UIColor.red
            // title number
            instructionCollections[instructionCount - 1].number.text = String(describing: (instructionCount + 1))
            // place holder
            instructionCollections[instructionCount - 1].text.placeholder = "Instruction " +
                (instructionCollections[instructionCount - 1].number.text)!
            // aspect fit
            instructionCollections[instructionCount - 1].button.imageView?.contentMode = .scaleAspectFit
            
            
            if cell != nil {
                print("tag: \(cell.tag)")
                stackView.insertArrangedSubview(cell, at: (8 + instructionCount + (ingredientCount + 1)))
                
                // adjusting height of constraints
                height1.constant = height1.constant + CGFloat(41)
                height2.constant = height2.constant + CGFloat(41)
            }
        }
    }
    
    @IBAction func stepButton(_ sender: UIButton) {
        if stepField.text == "" {
            stepView.shake()
            stepProgress.isHidden = false
        }
        else {
            stepProgress.isHidden = true
            stepCount += 1
            print ("The Count is: \(stepCount)")
            let a = CellV()
            stepCollections.insert(a, at: (stepCount - 1))
            
            
            stepCollections[stepCount - 1].text.delegate = self
            var cell = stepCollections[stepCount - 1].loadViewFromNib()
            
            // Colour
            // view bar
            stepCollections[stepCount - 1].view.backgroundColor = UIColor.init(red: 227/255.0, green: 193/255.0, blue: 80/255.0, alpha: 1)
            stepCollections[stepCount - 1].view1.backgroundColor = UIColor.init(red: 227/255.0, green: 193/255.0, blue: 80/255.0, alpha: 1)
            // progress bar
            stepCollections[stepCount - 1].progressBar.tintColor = UIColor.red
            // title number
            stepCollections[stepCount - 1].number.text = String(describing: (stepCount + 1))
            // place holder
            stepCollections[stepCount - 1].text.placeholder = "Step " +
                (stepCollections[stepCount - 1].number.text)!
            // aspect fit
            stepCollections[stepCount - 1].button.imageView?.contentMode = .scaleAspectFit
            
            
            if cell != nil {
                print("tag: \(cell.tag)")
                stackView.insertArrangedSubview(cell, at: (9 + instructionCount + (instructionCount + 1) + (stepCount + 1)))
                
                // adjusting height of constraints
                height1.constant = height1.constant + CGFloat(41)
                height2.constant = height2.constant + CGFloat(41)
            }
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
            ingredient = ingredientField.text!
            for allData in ingredientCollection {
                print("Baby: \(allData?.text.text)")
            }
            for allData in ingredientCollections {
                print("Abay: \(allData.text.text)")
                ingredient?.append(allData.text.text!)
                print(ingredient)
            }
            print (ingredient)
        
        instruction = instructionField.text!
        for allData in instructionCollection {
            print("Baby: \(allData?.text.text)")
        }
        for allData in instructionCollections {
            print("Abay: \(allData.text.text)")
            instruction?.append(allData.text.text!)
            print(instruction)
        }
        print (instruction)
        
        step = stepField.text!
        for allData in stepCollection {
            print("Baby: \(allData?.text.text)")
        }
        for allData in stepCollections {
            print("Abay: \(allData.text.text)")
            step?.append(allData.text.text!)
            print(step)
        }
        print (step)
    }
    
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

