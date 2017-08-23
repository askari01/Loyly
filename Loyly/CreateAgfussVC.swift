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
import Kingfisher
import GradientLoadingBar

class CreateAgfussVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var count = 0
    var agfusses = [Agfuss]()
    var json: JSON!
    var my:Int = 0
    var tag: String = "All"
    let pref = UserDefaults()
    var image = [UIImage]()
    
    let loadingBar = GradientLoadingBar(
        height: 3.0,
        durations: Durations(fadeIn: 1.0, fadeOut: 2.0, progress: 3.0),
        gradientColors: [
            UIColor(hexString:"#4cd964").cgColor,
            UIColor(hexString:"#ff2d55").cgColor
        ]
    )
    
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
        if count > 0 {
            return 1
        } else {
            var messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            messageLabel.text = "No data is currently available."
            messageLabel.textColor = UIColor.black
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont(name: "Palatino-Italic", size: 20)
            messageLabel.sizeToFit()
            tableView.backgroundView = messageLabel
            tableView.separatorStyle = .none
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print(indexPath)
        var agfus: Agfuss!
        agfus = agfusses[indexPath.row]
        performSegue(withIdentifier: "agfussDetails", sender: agfus)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AgfussCell {
           // print (indexPath.row)
            var title = String(describing: self.json["data"][indexPath.row]["title"])
            var tag = String(describing: self.json["data"][indexPath.row]["tags"])
            var time = String(describing: self.json["data"][indexPath.row]["time"])
            cell.tag = indexPath.row
            var img = String(describing: self.json["data"][indexPath.row]["pic_renamed"])
            let url = URL(string: "http:swatshawls.com/loyly/assets/uploads/\(img)")
            
            cell.setValues(title: title, tag: tag, time1: time, picture1: url!)

            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "agfussDetails" {
            if let detailsVC = segue.destination as? AgfussDetailVC {
                if let agfuss = sender as? Agfuss {
                    detailsVC.agfuss = agfuss
                }
            }
        }
    }
    
    @IBAction func valueChangeMy(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            my = 0
            getData()
        } else if sender.selectedSegmentIndex == 1 {
            my = 1
            getData()
        }
    }
    
    @IBAction func valueChangeTag(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            tag = "Classic"
            getData()
        } else if sender.selectedSegmentIndex == 1 {
            tag = "Modern"
            getData()
        } else if sender.selectedSegmentIndex == 2 {
            tag = "Steambath"
            getData()
        } else if sender.selectedSegmentIndex == 3 {
            tag = "Smoke"
            getData()
        } else if sender.selectedSegmentIndex == 4 {
            tag = "Show"
            getData()
        } else if sender.selectedSegmentIndex == 5 {
            tag = "All"
            getData()
        }
    }
    
    
    func getData() {
        loadingBar.show()
        var url: String = "http://swatshawls.com/loyly/Apis/getdata"
        if my == 1 {
            if let id = pref.value(forKey: "id"){
            print (id)
                url = "http://swatshawls.com/loyly/Apis/getdata/\(id)"
            }
        } else if my == 0 && tag == "All" {
            url = "http://swatshawls.com/loyly/Apis/getdata"
        } else if my == 0 && tag == "Classic" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Classic"
        } else if my == 0 && tag == "Modern" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Modern"
        } else if my == 0 && tag == "Steambath" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Steambath"
        } else if my == 0 && tag == "Smoke" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Smoke"
        } else if my == 0 && tag == "Show" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Show"
        }
        
        Alamofire.request(url).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                self.json = JSON(response.result.value)
                self.agfusses.removeAll()
                print (self.json)
            }
            self.count = self.json["data"].count
            self.tableView.reloadData()

            print (self.json["data"].count)
            
            for row in self.json["data"] {
                print ("Image Count: \(self.image.count)")
                var title = String(describing: self.json["data"][Int(row.0)!]["title"])
                var tag = String(describing: self.json["data"][Int(row.0)!]["tags"])
                var time = String(describing: self.json["data"][Int(row.0)!]["time"])
                var id = String(describing: self.json["data"][Int(row.0)!]["id"])
                var ingredient = String(describing: self.json["data"][Int(row.0)!]["ingredient"])
                var step = String(describing: self.json["data"][Int(row.0)!]["step"])
                var img = String(describing: self.json["data"][Int(row.0)!]["pic_renamed"])
                let url = URL(string: "http:swatshawls.com/loyly/assets/uploads/\(img)")
                
                var picture = String(describing: self.json["data"][Int(row.0)!]["picture"])
                print (id)
                let agfuss = Agfuss(title: title, tag: tag, time: time, ingredients: ingredient, steps: step, picture: url!)
                self.agfusses.append(agfuss)
            }
        }
        loadingBar.hide()
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
