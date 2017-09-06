//
//  OilDetailVC.swift
//  Loyly
//
//  Created by Syed Askari on 7/9/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class OilDetailVC: UIViewController {
    
    var oil: Oils!
    
    @IBOutlet weak var bannerOil: UIImageView!
    @IBOutlet weak var nameOil: UILabel!
    @IBOutlet weak var familyOil: UILabel!
    @IBOutlet weak var originOil: UILabel!
    @IBOutlet weak var strengthOil: UILabel!
    @IBOutlet weak var noteOil: UILabel!
    @IBOutlet weak var fragranceGroup: UILabel!
    @IBOutlet weak var extractionMethod: UILabel!
    @IBOutlet weak var partOfPlant: UILabel!
    @IBOutlet weak var plantInfo: UITextView!
    @IBOutlet weak var generalPropretise: UILabel!
    @IBOutlet weak var propertiseBody: UILabel!
    @IBOutlet weak var propertiseMind: UILabel!
    @IBOutlet weak var propertiseSkin: UILabel!
    @IBOutlet weak var fragrance: UILabel!
    @IBOutlet weak var aromaticMolecule: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var strength: UILabel!
    @IBOutlet weak var harmonizesWith: UITextView!
    @IBOutlet weak var chakra: UILabel!
    @IBOutlet weak var colour: UILabel!
    @IBOutlet weak var element: UILabel!
    @IBOutlet weak var didYouKnow: UITextView!
    @IBOutlet weak var contraindictions: UITextView!
    @IBOutlet weak var otherlanguages: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameOil.text = "Name: \(oil.name.capitalized)"
        bannerOil.image = UIImage(named: oil.name)
        familyOil.text = "Family: \(oil.plantFamily)"
        originOil.text = "Origin: \(oil.origin)"
        partOfPlant.text = "Part of Plant: \(oil.partOfPlant)"
        extractionMethod.text = "Extraction Method: \(oil.extractionmethod)"
        plantInfo.text = "Info: \(oil.plantInfo)"
        generalPropretise.text = "General Propertise: \(oil.generalPropertise)"
        propertiseBody.text = "Propertise Body: \(oil.propertiseBody)"
        propertiseMind.text = "Propertise Mind: \(oil.propertiseMind)"
        propertiseSkin.text = "Propertise Skin: \(oil.propertiseSkin)"
        fragranceGroup.text = "Fragrance Group: \(oil.fragrance)"
        fragrance.text = "Fragrance: \(oil.fragrance)"
        aromaticMolecule.text = "Aromatic Molecule: \(oil.aromaticMolecules)"
        noteOil.text = "Note: \(oil.note)"
        strengthOil.text = "Strength: \(oil.strength)"
        harmonizesWith.text = "Harmonizes: \(oil.harmonizesWith)"
        chakra.text = "Chakra: \(oil.chakra)"
        colour.text = "Colour: \(oil.colour)"
        element.text = "Element: \(oil.element)"
        didYouKnow.text = "Did You Know: \(oil.didYouKnow)"
        contraindictions.text = "Contraindictions: \(oil.contra)"
        otherlanguages.text = "Other Languages: \(oil.otherLanguages)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
