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
    
    init(name: String, botanicalName: String, plantFamily: String, origin: String, note: String, effect: String) {
        _name = name
        _botanicalName = botanicalName
        _plantFamily = plantFamily
        _origin = origin
        _note = note
        _effect = effect
    }
    
}
