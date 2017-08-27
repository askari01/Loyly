//
//  DataGet.swift
//  Loyly
//
//  Created by Syed Askari on 7/21/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import Foundation

public class GetData {
    func hitApi(url: String) -> String {
        let urlString = URL(string: "http://jsonplaceholder.typicode.com/users/1")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error")
                } else {
                    if let usableData = data {
//                        print(usableData) //JSONSerialization
                        do{
                            let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
//                            print (json)
                        }catch let error as NSError{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        return "Success"
    }

}
