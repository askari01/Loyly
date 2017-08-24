//
//  Education.swift
//  Loyly
//
//  Created by Syed Askari on 8/23/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import Foundation
import UIKit

class Education {
    
    private var _id: String!
    private var _level: String!
    private var _nextDate: String!
    private var _flanguage: String!
    private var _wearDate: String!
    private var _llanguage: String!
    private var _description: String!
    private var _topic: String!
    private var _picture: URL!
    
    //data protection for crashes
    var id: String {
        return _id
    }
    
    var level: String {
        return _level
    }
    
    var nextDate: String {
        return _nextDate
    }
    
    var flanguage: String {
        return _flanguage
    }
    
    var wearDate: String {
        return _wearDate
    }
    
    var llanguage: String {
        return _llanguage
    }
    
    var description: String {
        return _description
    }
    
    var topic: String {
        return _topic
    }
    
    var picture: URL {
        return _picture
    }
    
    init(id: String, level: String, nextDate: String, flanguage: String, wearDate: String, llanguage: String, description: String, topic: String, picture: URL) {
        _id = id
        _level = level
        _nextDate = nextDate
        _flanguage = flanguage
        _wearDate = wearDate
        _llanguage = llanguage
        _description = description
        _topic = topic
        _picture = picture
    }
    
}

