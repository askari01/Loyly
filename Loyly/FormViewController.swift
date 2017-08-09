//
//  FormViewController.swift
//  Loyly
//
//  Created by Syed Askari on 7/29/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire

class FormViewController: UIViewController, GameBoardUIViewDelegate,UITextFieldDelegate, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var height1: NSLayoutConstraint!
    @IBOutlet weak var height2: NSLayoutConstraint!
    @IBOutlet weak var height3: NSLayoutConstraint!
    @IBOutlet weak var height4: NSLayoutConstraint!
    
    @IBOutlet var viewMain: UIView!
    
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
    let picker = UIImagePickerController()
    
    // Save All
    @IBOutlet weak var saveAll: UIButton!
    
    // Ingredient Handler
    var ingredientCount: Int = 0
    var ingredient: String = "1"
    
    var ingredientCollection = [CellV?](repeating: CellV(), count: 64)
    var ingredientCollections = [CellV]()
    
    // Instruction Handler
    var instructionCount: Int = 0
    var instruction: String = "1"
    
    var instructionCollection = [CellV?](repeating: CellV(), count: 64)
    var instructionCollections = [CellV]()
    
    // Step Handler
    var stepCount: Int = 0
    var step: String = "1"
    
    // Tags Hadler
    var tag: String = "Classic"
    
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
        
        // tap gesture to add picture
        let tapImage = UITapGestureRecognizer.init(target: self, action: #selector(pickImageOptions))
        tapImage.numberOfTapsRequired = 1
        tapImage.delegate = self
        image.addGestureRecognizer(tapImage)
        picker.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // tap image
    func pickImageOptions() {
        // create the alert
        let alert = UIAlertController(title: "Profile Image", message: "Set your profile Image", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Select from Gallery", style: UIAlertActionStyle.default, handler: {action in
            self.pickImage()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.default, handler: { action in
            self.takeImage()
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func pickImage() {
        //        print("hello pick Image")
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    func takeImage() {
        //        print("hello take Image")
        picker.allowsEditing = true
        picker.sourceType = .camera
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
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
            self.ingredient.append("\n")
            self.ingredient.append(String(describing:(self.ingredientCount + 1)))
            self.ingredient.append(text)
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
    
    // tags change
    @IBAction func tagChanges(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            tag = "Classic"
        }
        else if sender.selectedSegmentIndex == 1 {
            tag = "Modren"
        }
        else if sender.selectedSegmentIndex == 2 {
            tag = "Stembath"
        }
        else if sender.selectedSegmentIndex == 3 {
            tag = "Smoke"
        }
        else {
            tag = "Show"
        }
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
//                height3.constant = height3.constant + CGFloat(41)
                
                
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
//                height3.constant = height3.constant + CGFloat(41)
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
//                height3.constant = height3.constant + CGFloat(41)
            }
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        var i = 2
//        ingredient.append(String(describing: i))
//        i = i+1
        ingredient = ingredient + ingredientField.text!
        
        for allData in ingredientCollections {
            step.append("\n")
            ingredient.append(String(describing: i))
            ingredient.append(allData.text.text!)
            i = i+1
        }
        print (ingredient)
        
//        instruction = instructionField.text!
//        for allData in instructionCollections {
//            instruction?.append(allData.text.text!)
//        }
//        print (instruction!)
        
        var j = 2
//        step?.append(String(describing: j))
//        j = j + 1
        step = step + stepField.text!
        for allData in stepCollections {
            step.append("\n")
            step.append(String(describing: j))
            step.append(allData.text.text!)
            j = j + 1
        }
        
        print (step)
        print (tag)
        print (titleField.text!)
        print (timeField.text!)
        
        // time to call api
        saveToServer()
    }
    
    func saveToServer() -> String {
        
        let name = timeField.text!
        let dataName = name.data(using: .utf8)!
        
        let tags = tag
        let dataTags = tags.data(using: .utf8)!
        
        let time = timeField.text!
        let dataTime = time.data(using: .utf8)!
        
        let ingredients = ingredient
        let dataIngredients = ingredients.data(using: .utf8)!
        
        let steps = step
        let dataSteps = steps.data(using: .utf8)!
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(UIImageJPEGRepresentation(self.image.image!, 1)!, withName: "picture", fileName: "hi.jpeg", mimeType: "image/jpeg")
                multipartFormData.append(dataName, withName: "title")
                multipartFormData.append(dataTags, withName: "tags")
                multipartFormData.append(dataTime, withName: "time")
                multipartFormData.append(dataIngredients, withName: "ingredients")
                multipartFormData.append(dataSteps, withName: "steps")
        },
            to: "http://swatshawls.com/loyly/Apis/savedata",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseString { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        })
        
        return "success"
    }
    
    // Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        let chosenImage: UIImage? = info[UIImagePickerControllerEditedImage] as! UIImage?
        image.image = chosenImage
        
        picker.dismiss(animated: true, completion: { _ in })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: { _ in })
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

