//
//  Oils.swift
//  Loyly
//
//  Created by Syed Askari on 7/9/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import Foundation

class Oils {
    
    private var _name: String!
    private var _otherLanguages: String!
    private var _botanicalName: String!
    private var _plantFamily: String!
    private var _partOfPlant: String!
    private var _extractionmethod: String!
    private var _aromaticMolecules: String!
    private var _origin: String!
    private var _note: String!
    private var _fragranceGroup: String!
    private var _fragrance: String!
    private var _chakra: String!
    private var _colour: String!
    private var _element: String!
    private var _plantInfo: String!
    private var _generalPropertise: String!
    private var _propertiseBody: String!
    private var _propertiseMind: String!
    private var _propertiseSkin: String!
    private var _harmonizesWith: String!
    private var _didYouKnow: String!
    private var _contra: String!
    private var _strength: String!
   
    
    
    //data protection for crashes
    var name: String {
        return _name
    }
    
    var otherLanguages: String {
        return _otherLanguages
    }
    
    var botanicalName: String {
        return _botanicalName
    }
    
    var plantFamily: String {
        return _plantFamily
    }
    
    var partOfPlant: String {
        return _partOfPlant
    }
    
    var extractionmethod: String {
        return _extractionmethod
    }
    
    var aromaticMolecules: String {
        return _aromaticMolecules
    }
    
    var origin: String {
        return _origin
    }
    
    var note: String {
        return _note
    }
    
    var fragranceGroup: String {
        return _fragranceGroup
    }
    
    var fragrance: String {
        return _fragrance
    }
    
    var chakra: String {
        return _chakra
    }
    
    var colour: String {
        return _colour
    }
    
    var element: String {
        return _element
    }
    
    var plantInfo: String {
        return _plantInfo
    }
    
    var generalPropertise: String {
        return _generalPropertise
    }
    
    var propertiseMind: String {
        return _propertiseMind
    }
    
    var propertiseBody: String {
        return _propertiseBody
    }
    
    var propertiseSkin: String {
        return _propertiseSkin
    }
    
    var harmonizesWith: String {
        return _harmonizesWith
    }
    
    var didYouKnow: String {
        return _didYouKnow
    }
    
    var contra: String {
        return _contra
    }
    
    var strength: String {
        return _strength
    }
    
    init(name: String,otherLanguages:String, botanicalName: String, plantFamily: String, partOfPlant: String, extractionmethod: String , aromaticMolecules: String, origin: String, note: String, fragranceGroup: String,  fragrance: String, chakra: String, colour: String, element: String, plantInfo: String, generalPropertise: String, propertiseMind: String, propertiseBody: String, propertiseSkin: String, harmonizesWith: String, didYouKnow: String, contra: String, strength: String) {
        _name = name
        _otherLanguages = otherLanguages
        _botanicalName = botanicalName
        _plantFamily = plantFamily
        _partOfPlant = partOfPlant
        _extractionmethod = extractionmethod
        _aromaticMolecules = aromaticMolecules
        _origin = origin
        _note = note
        _fragranceGroup = fragranceGroup
        _fragrance = fragrance
        _chakra = chakra
        _colour = colour
        _element = element
        _plantInfo = plantInfo
        _generalPropertise = generalPropertise
        _propertiseBody = propertiseBody
        _propertiseMind = propertiseMind
        _propertiseSkin = propertiseSkin
        _harmonizesWith = harmonizesWith
        _didYouKnow = didYouKnow
        _contra = contra
        _strength = strength
    }
    
}
