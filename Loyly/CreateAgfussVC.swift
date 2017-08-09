//
//  CreateAgfussVC.swift
//  Loyly
//
//  Created by Syed Askari on 8/5/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CreateAgfussVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var count = 0
    var agfusses = [Agfuss]()
    var json: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AgfussCell {
            print (indexPath.row)
            var title = String(describing: self.json["data"][indexPath.row]["title"])
            var tag = String(describing: self.json["data"][indexPath.row]["tags"])
            var time = String(describing: self.json["data"][indexPath.row]["time"])
            cell.setValues(title: title, tag: tag, time1: time)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func getData() {
        Alamofire.request("http://swatshawls.com/loyly/Apis/getdata").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                self.json = JSON(response.result.value)
            }
            self.count = self.json["data"].count
            self.tableView.reloadData()
            print (self.json["data"].count)
        }
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
