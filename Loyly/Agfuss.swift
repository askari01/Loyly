//
//  Agfuss.swift
//  Loyly
//
//  Created by Syed Askari on 8/9/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import Foundation

class Agfuss {

    private var _title: String!
    private var _tag: String!
    private var _time: String!
    private var _ingredients: String!
    private var _steps: String!
    private var _picture: String!
    
    //data protection
    
    var title: String {
        return _title
    }
    
    var tag: String {
        return _tag
    }
    
    var time: String {
        return _time
    }
    
    var ingredients: String {
        return _ingredients
    }
    
    var steps: String {
        return _steps
    }
    
    var picture: String {
        return _picture
    }
    
    init(title: String, tag: String, time: String, ingredients: String, steps: String, picture: String) {
        _title = title
        _tag = tag
        _time = time
        _ingredients = ingredients
        _steps = steps
        _picture = picture
    }
}
