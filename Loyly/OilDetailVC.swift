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
        nameOil.text = oil.name.capitalized
        bannerOil.image = UIImage(named: oil.name)
        familyOil.text = oil.plantFamily
        originOil.text = oil.origin
        extractionMethod.text = oil.extractionmethod
        plantInfo.text = oil.plantInfo
        generalPropretise.text = oil.generalPropertise
        propertiseBody.text = oil.propertiseBody
        propertiseMind.text = oil.propertiseMind
        propertiseSkin.text = oil.propertiseSkin
        fragranceGroup.text = oil.fragrance
        fragrance.text = oil.fragrance
        aromaticMolecule.text = oil.aromaticMolecules
        noteOil.text = oil.note
        strengthOil.text = oil.strength
        harmonizesWith.text = oil.harmonizesWith
        chakra.text = oil.chakra
        colour.text = oil.colour
        element.text = oil.element
        didYouKnow.text = oil.didYouKnow
        contraindictions.text = oil.contra
        otherlanguages.text = oil.otherLanguages
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
