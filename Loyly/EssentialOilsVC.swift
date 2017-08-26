//
//  EssentialOilsVC.swift
//  Loyly
//
//  Created by Syed Askari on 7/6/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class EssentialOilsVC: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var oils = [Oils]()
    var filteredOils = [Oils]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // table view
        tableView.delegate = self
        tableView.dataSource = self
        
        // search bar
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search
        searchBar.layer.cornerRadius = 5
        
        parseOilCSV()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                //                imageView.isHidden = true
                self.view.frame.origin.y -= 0
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                //                imageView.isHidden = false
                self.view.frame.origin.y += 0
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
    
    func parseOilCSV() {
        let path = Bundle.main.path(forResource: "oilNew", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            // printing
            print (rows)
            
            for row in rows {
                let oilNameOil = row["name"]!
                let otherLanguagesOil = row["Otherlanguages"]!
                let botanicalNameOil = row["botanicalName"]!
                let plantFamilyOil = row["plantFamily"]!
                let originOil = row["origin"]!
                let partOfPlantOil = row["partOfPlant"]!
                let extractionMethodOil = row["extractionmethod"]!
                let aromaticMoleculesOil = row["Aromatic molecules"]!
                let noteOil = row["note"]!
                let fragranceGroupOil = row["fragrancegroup"]!
                let fragranceOil = row["Fragrance"]!
                let chakraOil = row["Chakra"]!
                let colourOil = row["Color"]!
                let elementOil = row["Element"]!
                let plantInfoOil = row["plantInfo"]!
                let generalPropertiseOil = row["General proporties"]!
                let propertiseBodyOil = row["Proporties body"]!
                let propertiseMindOil = row["Proporties mind"]!
                let propertiseSkinOil = row["Proporties skin"]!
                let harmonizesWithOil = row["HarmonizesWith"]!
                let didYouKnowOil = row["Did you know?"]!
                let contraOil = row["CONTRAINDICATIONS"]!
                let strengthOil = row["strength"]!
                
                
                let oil = Oils(name: oilNameOil, otherLanguages: otherLanguagesOil, botanicalName: botanicalNameOil, plantFamily: plantFamilyOil, partOfPlant: partOfPlantOil, extractionmethod: extractionMethodOil, aromaticMolecules: aromaticMoleculesOil, origin: originOil, note: noteOil, fragranceGroup: fragranceGroupOil, fragrance: fragranceOil, chakra: chakraOil, colour: colourOil, element: elementOil, plantInfo: plantInfoOil, generalPropertise: generalPropertiseOil, propertiseMind: propertiseMindOil, propertiseBody: propertiseBodyOil, propertiseSkin: propertiseSkinOil, harmonizesWith: harmonizesWithOil, didYouKnow: didYouKnowOil, contra: contraOil, strength: strengthOil)
                oils.append(oil)
            }
            
            
        } catch let err as NSError {
            print(err.debugDescription)
            
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

    func numberOfSections(in tableView: UITableView) -> Int {
        if oils.count > 0 {
            return 1
        } else {
            var messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            messageLabel.text = "No data is currently available."
            messageLabel.textColor = UIColor.black
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont(name: "Palatino-Italic", size: 20)
            messageLabel.sizeToFit()
            tableView.backgroundView = messageLabel
            tableView.separatorStyle = .none
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredOils.count
        }
        
        return oils.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OilCell {
            
            cell.layer.cornerRadius = 5
            
            let oil: Oils!
            if inSearchMode {
                oil = filteredOils[indexPath.row]
                cell.configureCell(oil)
            } else {
                oil = oils[indexPath.row]
                cell.configureCell(oil)
            }
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var oil: Oils!
        
        if inSearchMode {
            oil = filteredOils[indexPath.row]
        } else {
            oil = oils[indexPath.row]
        }
        
//        to be done
        performSegue(withIdentifier: "oilDetails", sender: oil)
    }
    
    func searchButtonPressed() {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            tableView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text!.uppercased()
            print ("lower: \(lower)")
            filteredOils = oils.filter({$0.name.range(of: lower) != nil})
            print ("filtered List: \(oils[0])")
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oilDetails" {
            if let detailsVC = segue.destination as? OilDetailVC {
                if let oil = sender as? Oils {
                    detailsVC.oil = oil
                }
            }
        }
    }
    
}
