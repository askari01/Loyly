//
//  FormViewController.swift
//  Loyly
//
//  Created by Syed Askari on 7/29/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import GradientLoadingBar
import ScrollableSegmentedControl

class FormViewController: UIViewController, GameBoardUIViewDelegate,UITextFieldDelegate, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var height1: NSLayoutConstraint!
    @IBOutlet weak var height2: NSLayoutConstraint!
    @IBOutlet weak var height3: NSLayoutConstraint!
    @IBOutlet weak var height4: NSLayoutConstraint!
    
    @IBOutlet var viewMain: UIView!
    
    @IBOutlet var gameBoardUIView: CellV!
    
    // Sections
    @IBOutlet weak var titleSection: UILabel!
    @IBOutlet weak var tagSection: UILabel!
    @IBOutlet weak var timeSection: UILabel!
    @IBOutlet weak var ingredientSection: UILabel!
    @IBOutlet weak var instructionSection: UILabel!
    @IBOutlet weak var imageSection: UILabel!
    
    
    // Title
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleField: UITextField!
    
    // Tags
    @IBOutlet weak var tags: UISegmentedControl!
    @IBOutlet weak var tagView: ScrollableSegmentedControl!
   // @IBOutlet weak var segmentedControl: ScrollableSegmentedControl!
    
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
    
    // JSON Response
    var json: JSON!
    
    // Loading Bar
    let loadingBar = GradientLoadingBar(
        height: 3.0,
        durations: Durations(fadeIn: 1.0, fadeOut: 2.0, progress: 3.0),
        gradientColors: [
            UIColor(hexString:"#4cd964").cgColor,
            UIColor(hexString:"#ff2d55").cgColor
        ]
    )
    
    var stepCollection = [CellV?](repeating: CellV(), count: 64)
    var stepCollections = [CellV]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        print (stackView.arrangedSubviews.count)
        ingredientCollection[ingredientCount]?.delegate = self
        instructionCollection[instructionCount]?.delegate = self
        stepCollection[stepCount]?.delegate = self
        
        // segmented Controls
        tagView.segmentStyle = .textOnly
        tagView.insertSegment(withTitle: "Classic", at: 0)
        tagView.insertSegment(withTitle: "Modern", at: 1)
        tagView.insertSegment(withTitle: "SteamBath", at: 2)
        tagView.insertSegment(withTitle: "Airways", at: 3)
        tagView.insertSegment(withTitle: "Purification", at: 4)
        tagView.insertSegment(withTitle: "Immunesystem", at: 5)
        tagView.insertSegment(withTitle: "Seasonal", at: 6)
        tagView.insertSegment(withTitle: "Relax", at: 7)
        tagView.insertSegment(withTitle: "Balancing", at: 8)
        tagView.insertSegment(withTitle: "Activating", at: 9)
        tagView.insertSegment(withTitle: "Meditation", at: 10)
        tagView.insertSegment(withTitle: "Entertainment", at: 11)
        tagView.insertSegment(withTitle: "Smoke", at: 12)
        tagView.insertSegment(withTitle: "Show", at: 13)
        
        tagView.underlineSelected = true
        tagView.selectedSegmentIndex = 0
        
        tagView.addTarget(self, action: #selector(FormViewController.segmentSelected(sender:)), for: .valueChanged)
        
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
        
//        // testing shadow
//        let radius: CGFloat = titleSection.frame.width / 2.0 //change it to .height if you need spread for height
//        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: titleSection.frame.height))
//        //Change 2.1 to amount of spread you need and for height replace the code for height
//        
//        titleSection.layer.cornerRadius = 2
//        titleSection.layer.shadowColor = UIColor.black.cgColor
//        titleSection.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
//        titleSection.layer.shadowOpacity = 0.5
//        titleSection.layer.shadowRadius = 5.0 //Here your control your blur
//        titleSection.layer.masksToBounds =  false
//        titleSection.layer.shadowPath = shadowPath.cgPath
        
//        titleSection.layer.shadowColor = UIColor.black.cgColor
//        titleSection.layer.shadowOpacity = 1
//        titleSection.layer.shadowOffset = CGSize.zero
//        titleSection.layer.shadowRadius = 10
//        
//        titleSection.layer.shadowPath = UIBezierPath(rect: titleSection.bounds).cgPath
//        titleSection.layer.shouldRasterize = true
        
    }
    
    func segmentSelected(sender:ScrollableSegmentedControl) {
        print("Segment at index \(sender.selectedSegmentIndex)  selected")
        if sender.selectedSegmentIndex == 0 {
            tag = "Classic"
        } else if sender.selectedSegmentIndex == 1 {
            tag = "Modern"
        } else if sender.selectedSegmentIndex == 2 {
            tag = "SteamBath"
        } else if sender.selectedSegmentIndex == 3 {
            tag = "Airways"
        } else if sender.selectedSegmentIndex == 4 {
            tag = "Purification"
        } else if sender.selectedSegmentIndex == 5 {
            tag = "Immunesystem"
        } else if sender.selectedSegmentIndex == 6 {
            tag = "Seasonal"
        } else if sender.selectedSegmentIndex == 7 {
            tag = "Relax"
        } else if sender.selectedSegmentIndex == 8 {
            tag = "Balancing"
        } else if sender.selectedSegmentIndex == 9 {
            tag = "Activating"
        } else if sender.selectedSegmentIndex == 10 {
            tag = "Meditation"
        } else if sender.selectedSegmentIndex == 11 {
            tag = "Entertainment"
        } else if sender.selectedSegmentIndex == 12 {
            tag = "Smoke"
        } else {
            tag = "Show"
        }
        
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
//            print("Game Over")
            self.ingredient.append("\n")
            self.ingredient.append(String(describing:(self.ingredientCount + 1)))
            self.ingredient.append(text)
//            print(self.ingredient)
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
//            print ("The Count is: \(ingredientCount)")
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
//                print("tag: \(cell.tag)")
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
//                print("tag: \(cell.tag)")
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
//            print ("The Count is: \(stepCount)")
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
//                print("tag: \(cell.tag)")
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
            ingredient.append(",")
            ingredient.append(String(describing: i))
            ingredient.append(allData.text.text!)
            i = i+1
        }
//        print ("Ingred: \(ingredient)")
        
//        instruction = instructionField.text!
//        for allData in instructionCollections {
//            instruction?.append(allData.text.text!)
//        }
//        print (instruction!)
        
        var j = 2
//        step?.append(String(describing: j))
//        j = j + 1
        step = step + instructionField.text!
        for allData in instructionCollections {
            step.append(",")
            step.append(String(describing: j))
            step.append(allData.text.text!)
            j = j + 1
        }
        
////        print ("STEPS: \(step)")
//        print (tag)
//        print (titleField.text!)
//        print (timeField.text!)
//
        // time to call api
        if titleField.text != "" && timeField.text != "" && instructionField.text != "" && ingredientField.text != "" {
            saveToServer()
        } else {
            let alert = UIAlertController(title: "Response", message: "Incomplete Data, Enter Data in all fields above", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {
                action in
            }))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func saveToServer() -> String {
        
        loadingBar.show()
        
        let name = titleField.text!
        let dataName = name.data(using: .utf8)!
        
        let tags = tag
        let dataTags = tags.data(using: .utf8)!
        
        let time = timeField.text!
        let dataTime = time.data(using: .utf8)!
        
        let ingredients = ingredient
        let dataIngredients = ingredients.data(using: .utf8)!
        
        let steps = step
        let dataSteps = steps.data(using: .utf8)!
        let pref = UserDefaults()
        let currentDateTime = String (describing: Date())
        let id = pref.value(forKey: "id")!
//        print ("ID: \(id)")
        let ID1 = String(describing: id)
//        print ("ID1: \(ID1)")
        let ID2 = ID1.data(using: .utf8)!
//        print ("ID2: \(ID2)")
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(UIImageJPEGRepresentation(self.image.image!, 1)!, withName: "picture", fileName: "\(currentDateTime).jpeg", mimeType: "image/jpeg")
                multipartFormData.append(dataName, withName: "title")
                multipartFormData.append(dataTags, withName: "tags")
                multipartFormData.append(dataTime, withName: "time")
                multipartFormData.append(dataIngredients, withName: "ingredients")
                multipartFormData.append(ID2, withName: "userid")
                multipartFormData.append(dataSteps, withName: "steps")
        },
            to: "http://swatshawls.com/loyly/Apis/savedata",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseString { response in
//                        debugPrint(response)
                        if let json = response.result.value {
//                            print("JSON: \(json)") // serialized json response
                            self.json = JSON(response.result.value)
//                            print (self.json)
                        }
                        let alert = UIAlertController(title: "Response", message: "Agfuss is added and is now waiting for approval, please wait for approval...", preferredStyle: UIAlertControllerStyle.alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {
                            action in
                            self.loadingBar.hide()
                            self.performSegue(withIdentifier: "agfussAdded", sender: self)
                        }))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
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

