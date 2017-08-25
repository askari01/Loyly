//
//  ViewController.swift
//  Loyly
//
//  Created by Syed Askari on 7/6/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
//import CoreData
//import SQLite

class ViewController: UIViewController {

    @IBOutlet weak var englishBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // testing data
//        let path = Bundle.main.path(forResource: "oilNew", ofType: "csv")
//        let start = DispatchTime.now()
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
        
//        do {
//            let csv = try CSV(contentsOfURL: path!)
//            print ("\(csv)")
//            let rows = csv.rows
//            let columns = csv.columns
//
////            for column in columns {
////                print ("column: \(column)")
////            }
//
//            print (rows.count)
//            for row in rows {
//                print ("row: \(row["name"]!)")
//                print ("row: \(row["Otherlanguages"]!)")
//                print ("row: \(row["botanicalName"]!)")
//                print ("row: \(row["plantFamily"]!)")
//                print ("row: \(row["origin"]!)")
//                print ("row: \(row["partOfPlant"]!)")
//                print ("row: \(row["extractionmethod"]!)")
//                print ("row: \(row["Aromatic molecules"]!)")
//                print ("row: \(row["note"]!)")
//                print ("row: \(row["strength"]!)")
//                print ("row: \(row["fragrancegroup"]!)")
//                print ("row: \(row["Fragrance"]!)")
//                print ("row: \(row["Chakra"]!)")
//                print ("row: \(row["Color"]!)")
//                print ("row: \(row["Element"]!)")
//                print ("row: \(row["plantInfo"]!)")
//                print ("row: \(row["General proporties"]!)")
//                print ("row: \(row["Proporties body"]!)")
//                print ("row: \(row["Proporties mind"]!)")
//                print ("row: \(row["Proporties skin"]!)")
//                print ("row: \(row["HarmonizesWith"]!)")
//                print ("row: \(row["Did you know?"]!)")
//                print ("row: \(row["CONTRAINDICATIONS"]!)")
//
//                // Core Saving
////                let oils = NSEntityDescription.insertNewObject(forEntityName: "OilsEntity", into: context)
////
////                oils.setValue(row["name"]! , forKey: "name")
////                oils.setValue(row["Otherlanguages"]! , forKey: "otherLanguages")
////                oils.setValue(row["botanicalName"]! , forKey: "botanicalName")
////                oils.setValue(row["plantFamily"]! , forKey: "plantFamily")
////                oils.setValue(row["origin"]! , forKey: "origin")
////                oils.setValue(row["partOfPlant"]! , forKey: "partOfPlant")
////                oils.setValue(row["extractionmethod"]! , forKey: "extractionMethod")
////                oils.setValue(row["Aromatic molecules"]! , forKey: "aromaticMolecules")
////                oils.setValue(row["note"]! , forKey: "note")
////                oils.setValue(row["strength"]! , forKey: "strength")
////                oils.setValue(row["fragrancegroup"]! , forKey: "fragranceGroup")
////                oils.setValue(row["Fragrance"]! , forKey: "fragrance")
////                oils.setValue(row["Chakra"]! , forKey: "chakra")
////                oils.setValue(row["Color"]! , forKey: "color")
////                oils.setValue(row["Element"]! , forKey: "element")
////                oils.setValue(row["plantInfo"]! , forKey: "plantInfo")
////                oils.setValue(row["General proporties"]! , forKey: "generalProporties")
////                oils.setValue(row["Proporties body"]! , forKey: "proportiesBody")
////                oils.setValue(row["Proporties mind"]! , forKey: "proportiesMind")
////                oils.setValue(row["Proporties skin"]! , forKey: "proportiesSkin")
////                oils.setValue(row["HarmonizesWith"]! , forKey: "harmonizesWith")
////                oils.setValue(row["Did you know?"]! , forKey: "didYouKnow")
////                oils.setValue(row["CONTRAINDICATIONS"]! , forKey: "contraindications")
////
////
////                do {
////                    try context.save()
////                    print ("successful inserting data into coreData")
////                } catch _ {
////                    print ("Error with CoreData")
////                }
//            }
//        } catch _ {
//            print ("error parsing csv file")
//        }
        
        // Core Viewing
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "OilsEntity")
//
//        request.returnsObjectsAsFaults = false
//
//        do {
//            let results = try context.fetch(request)
//            if results.count > 0 {
//                for result in results as! [NSManagedObject] {
//                    if let name = result.value(forKey: "name") as? String {
//                        print("name: \(name)")
//                    }
//                    if let otherLanguages = result.value(forKey: "otherLanguages") as? String {
//                        print("otherLanguages: \(otherLanguages)")
//                    }
//                    if let botanicalName = result.value(forKey: "botanicalName") as? String {
//                        print("botanicalName: \(botanicalName)")
//                    }
//                    if let plantFamily = result.value(forKey: "plantFamily") as? String {
//                        print("plantFamily: \(plantFamily)")
//                    }
//                    if let origin = result.value(forKey: "origin") as? String {
//                        print("origin: \(origin)")
//                    }
//                    if let partOfPlant = result.value(forKey: "partOfPlant") as? String {
//                        print("partOfPlant: \(partOfPlant)")
//                    }
//                    if let extractionMethod = result.value(forKey: "extractionMethod") as? String {
//                        print("extractionMethod: \(extractionMethod)")
//                    }
//                    if let aromaticMolecules = result.value(forKey: "aromaticMolecules") as? String {
//                        print("aromaticMolecules: \(aromaticMolecules)")
//                    }
//                    if let note = result.value(forKey: "note") as? String {
//                        print("note: \(note)")
//                    }
//                    if let strength = result.value(forKey: "strength") as? String {
//                        print("strength: \(strength)")
//                    }
//                    if let fragranceGroup = result.value(forKey: "fragranceGroup") as? String {
//                        print("fragranceGroup: \(fragranceGroup)")
//                    }
//                    if let fragrance = result.value(forKey: "fragrance") as? String {
//                        print("fragrance: \(fragrance)")
//                    }
//                    if let chakra = result.value(forKey: "chakra") as? String {
//                        print("chakra: \(chakra)")
//                    }
//                    if let color = result.value(forKey: "color") as? String {
//                        print("color: \(color)")
//                    }
//                    if let element = result.value(forKey: "element") as? String {
//                        print("element: \(element)")
//                    }
//                    if let plantInfo = result.value(forKey: "plantInfo") as? String {
//                        print("plantInfo: \(plantInfo)")
//                    }
//                    if let generalProporties = result.value(forKey: "generalProporties") as? String {
//                        print("generalProporties: \(generalProporties)")
//                    }
//                    if let proportiesBody = result.value(forKey: "proportiesBody") as? String {
//                        print("proportiesBody: \(proportiesBody)")
//                    }
//                    if let proportiesMind = result.value(forKey: "proportiesMind") as? String {
//                        print("proportiesMind: \(proportiesMind)")
//                    }
//                    if let proportiesSkin = result.value(forKey: "proportiesSkin") as? String {
//                        print("proportiesSkin: \(proportiesSkin)")
//                    }
//                    if let harmonizesWith = result.value(forKey: "harmonizesWith") as? String {
//                        print("harmonizesWith: \(harmonizesWith)")
//                    }
//                    if let didYouKnow = result.value(forKey: "didYouKnow") as? String {
//                        print("didYouKnow: \(didYouKnow)")
//                    }
//                    if let contraindications = result.value(forKey: "contraindications") as? String {
//                        print("contraindications: \(contraindications)")
//                    }
//                }
//            } else {
//                print ("No data in CoreData")
//            }
//        } catch _ {
//            print ("Error with CoreData")
//        }
        
//        // SQL Saving
////                DBUtil.sharedInstance.addOil(name: row["name"]! , otherLanguages: row["Otherlanguages"]! , botanicalName: row["botanicalName"]! , plantFamily: row["plantFamily"]! , origin: row["origin"]! , partOfPlant: row["partOfPlant"]! , extractionMethod: row["extractionmethod"]! , aromaticMolecules: row["Aromatic molecules"]! , note: row["note"]! , strength: row["strength"]! , fragranceGroup: row["fragrancegroup"]! , fragrance: row["Fragrance"]! , chakra: row["Chakra"]! , color: row["Color"]! , element: row["Element"]! , plantInfo: row["plantInfo"]! , generalProporties: row["General proporties"]! , proportiesBody: row["Proporties body"]! , proportiesMind: row["Proporties mind"]! , proportiesSkin: row["Proporties skin"]! , harmonizesWith: row["HarmonizesWith"]! , didYouKnow: row["Did you know?"]! , contraindications: row["CONTRAINDICATIONS"]! )

        
//        // sql Viewing
//        DBUtil.sharedInstance.getAll()
        
//        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
//
//        print("Time to evaluate : \(timeInterval) seconds")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

