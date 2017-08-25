//
//  DBUtil.swift
//  Loyly
//
//  Created by Syed Askari on 8/25/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import Foundation
import SQLite

class DBUtil {
    
    var oil: Oils!
    static var sharedInstance = DBUtil()
    var db: Connection?
    
    let oilsTable = Table("Oils")
    
    let id = Expression<Int64>("Id")
    let name = Expression<String>("Name")
    let otherLanguages = Expression<String>("OtherLanguages")
    let botanicalName = Expression<String>("BotanicalName")
    let plantFamily = Expression<String>("PlantFamily")
    let origin = Expression<String>("Origin")
    let partOfPlant = Expression<String>("PartOfPlant")
    let extractionMethod = Expression<String>("ExtractionMethod")
    let aromaticMolecules = Expression<String>("AromaticMolecules")
    let note = Expression<String>("Note")
    let strength = Expression<String>("strength")
    let fragranceGroup = Expression<String>("FragranceGroup")
    let fragrance = Expression<String>("Fragrance")
    let chakra = Expression<String>("Chakra")
    let color = Expression<String>("Color")
    let element = Expression<String>("Element")
    let plantInfo = Expression<String>("PlantInfo")
    let generalProporties = Expression<String>("GeneralProporties")
    let proportiesBody = Expression<String>("ProportiesBody")
    let proportiesMind = Expression<String>("ProportiesMind")
    let proportiesSkin = Expression<String>("ProportiesSkin")
    let harmonizesWith = Expression<String>("HarmonizesWith")
    let didYouKnow = Expression<String>("DidYouKnow")
    let contraindications = Expression<String>("Contraindications")
    
    init() {
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print (path)
        do {
            db = try Connection("\(path)/OilsDB.sqlite3")
            try db?.run(oilsTable.create( temporary: false, ifNotExists: true, block: {
                t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(otherLanguages)
                t.column(botanicalName)
                t.column(plantFamily)
                t.column(origin)
                t.column(partOfPlant)
                t.column(extractionMethod)
                t.column(aromaticMolecules)
                t.column(note)
                t.column(strength)
                t.column(fragranceGroup)
                t.column(fragrance)
                t.column(chakra)
                t.column(color)
                t.column(element)
                t.column(plantInfo)
                t.column(generalProporties)
                t.column(proportiesBody)
                t.column(proportiesMind)
                t.column(proportiesSkin)
                t.column(harmonizesWith)
                t.column(didYouKnow)
                t.column(contraindications)
            }))
        } catch _ {
            print ("error connecting with database")
        }
    }
    
    func addOil(name: String, otherLanguages: String, botanicalName: String, plantFamily: String,
                origin: String, partOfPlant: String, extractionMethod: String, aromaticMolecules: String, note: String, strength: String, fragranceGroup: String, fragrance: String, chakra: String, color: String, element: String, plantInfo: String, generalProporties: String, proportiesBody: String, proportiesMind: String, proportiesSkin: String, harmonizesWith: String, didYouKnow: String, contraindications: String) {
        do {
             try db!.run(oilsTable.insert(self.name<-name, self.otherLanguages<-otherLanguages, self.botanicalName<-botanicalName, self.plantFamily<-plantFamily, self.partOfPlant<-partOfPlant, self.extractionMethod<-extractionMethod, self.aromaticMolecules<-aromaticMolecules, self.note<-note, self.origin<-origin, self.strength<-strength, self.fragranceGroup<-fragranceGroup, self.fragrance<-fragrance, self.chakra<-chakra, self.color<-color, self.element<-element, self.plantInfo<-plantInfo, self.generalProporties<-generalProporties, self.proportiesBody<-proportiesBody, self.proportiesMind<-proportiesMind, self.proportiesSkin<-proportiesSkin, self.harmonizesWith<-harmonizesWith, self.didYouKnow<-didYouKnow, self.contraindications<-contraindications))
            print ("Insert Successful")
        } catch _ {
            print ("Insert Error")
        }
    }
    
    func getAll() {
        do {
            let all = Array(try db!.prepare(oilsTable))
            for data in all {
                print (data)
            }
        } catch _ {
            print ("Error get all")
        }
    }
    
}
