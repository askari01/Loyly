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
    private var _botanicalName: String!
    private var _plantFamily: String!
    private var _origin: String!
    private var _note: String!
    private var _effect: String!
    private var _strength: String!
    private var _fragrance: String!
    
    
    //data protection for crashes
    var name: String {
        return _name
    }
    
    var botanicalName: String {
        return _botanicalName
    }
    
    var plantFamily: String {
        return _plantFamily
    }
    
    var origin: String {
        return _origin
    }
    
    var note: String {
        return _note
    }
    
    var effect: String {
        return _effect
    }
    
    var strength: String {
        return _strength
    }
    
    var fragrance: String {
        return _fragrance
    }
    
    init(name: String, botanicalName: String, plantFamily: String, origin: String, note: String, effect: String, strength: String, fragrance: String) {
        _name = name
        _botanicalName = botanicalName
        _plantFamily = plantFamily
        _origin = origin
        _note = note
        _effect = effect
        _strength = strength
        _fragrance = fragrance
    }
    
}
