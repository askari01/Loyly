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
import ScrollableSegmentedControl

class CreateAgfussVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tagView: ScrollableSegmentedControl!
    
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
        // seperator
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView.separatorColor = UIColor.black
        
        // segment control
        // segmented Controls
        tagView.segmentStyle = .textOnly
        tagView.insertSegment(withTitle: "All", at: 0)
        tagView.insertSegment(withTitle: "Classic", at: 1)
        tagView.insertSegment(withTitle: "Modern", at: 2)
        tagView.insertSegment(withTitle: "SteamBath", at: 3)
        tagView.insertSegment(withTitle: "Airways", at: 4)
        tagView.insertSegment(withTitle: "Purification", at: 5)
        tagView.insertSegment(withTitle: "Immunesystem", at: 6)
        tagView.insertSegment(withTitle: "Seasonal", at: 7)
        tagView.insertSegment(withTitle: "Relax", at: 8)
        tagView.insertSegment(withTitle: "Balancing", at: 9)
        tagView.insertSegment(withTitle: "Activating", at: 10)
        tagView.insertSegment(withTitle: "Meditation", at: 11)
        tagView.insertSegment(withTitle: "Entertainment", at: 12)
        tagView.insertSegment(withTitle: "Smoke", at: 13)
        tagView.insertSegment(withTitle: "Show", at: 14)
        
        
        tagView.underlineSelected = true
        tagView.selectedSegmentIndex = 0
        
        tagView.addTarget(self, action: #selector(FormViewController.segmentSelected(sender:)), for: .valueChanged)
        
        getData()
    }
    
    func segmentSelected(sender:ScrollableSegmentedControl) {
        print("Segment at index \(sender.selectedSegmentIndex)  selected")
        if sender.selectedSegmentIndex == 0 {
            tag = "All"
            getData()
        } else if sender.selectedSegmentIndex == 1 {
            tag = "Classic"
            getData()
        } else if sender.selectedSegmentIndex == 2 {
            tag = "Modern"
            getData()
        } else if sender.selectedSegmentIndex == 3 {
            tag = "SteamBath"
            getData()
        } else if sender.selectedSegmentIndex == 4 {
            tag = "Airways"
            getData()
        } else if sender.selectedSegmentIndex == 5 {
            tag = "Purification"
            getData()
        } else if sender.selectedSegmentIndex == 6 {
            tag = "Immunesystem"
            getData()
        } else if sender.selectedSegmentIndex == 7 {
            tag = "Seasonal"
            getData()
        } else if sender.selectedSegmentIndex == 8 {
            tag = "Relax"
            getData()
        } else if sender.selectedSegmentIndex == 9 {
            tag = "Balancing"
            getData()
        } else if sender.selectedSegmentIndex == 10 {
            tag = "Activating"
            getData()
        } else if sender.selectedSegmentIndex == 11 {
            tag = "Meditation"
            getData()
        } else if sender.selectedSegmentIndex == 12 {
            tag = "Entertainment"
            getData()
        } else if sender.selectedSegmentIndex == 13 {
            tag = "Smoke"
            getData()
        } else {
            tag = "Show"
            getData()
        }
        
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
//            print (id)
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
        } else if my == 0 && tag == "Entertainment" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Entertainment"
        } else if my == 0 && tag == "Meditation" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Meditation"
        } else if my == 0 && tag == "Activating" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Activating"
        } else if my == 0 && tag == "Balancing" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Balancing"
        } else if my == 0 && tag == "Relax" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Relax"
        } else if my == 0 && tag == "Seasonal" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Seasonal"
        } else if my == 0 && tag == "Immunesystem" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Immunesystem"
        } else if my == 0 && tag == "Purification" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Purification"
        } else if my == 0 && tag == "Airways" {
            url = "http://swatshawls.com/loyly/Apis/getbytag/Airways"
        }
        
        
        Alamofire.request(url).responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
                self.json = JSON(response.result.value)
                self.agfusses.removeAll()
//                print (self.json)
            }
            self.count = self.json["data"].count
            self.tableView.reloadData()

//            print (self.json["data"].count)
            
            for row in self.json["data"] {
//                print ("Image Count: \(self.image.count)")
                var title = String(describing: self.json["data"][Int(row.0)!]["title"])
                var tag = String(describing: self.json["data"][Int(row.0)!]["tags"])
                var time = String(describing: self.json["data"][Int(row.0)!]["time"])
                var id = String(describing: self.json["data"][Int(row.0)!]["id"])
                var ingredient = String(describing: self.json["data"][Int(row.0)!]["ingredient"])
                var step = String(describing: self.json["data"][Int(row.0)!]["steps"])
                var img = String(describing: self.json["data"][Int(row.0)!]["pic_renamed"])
                let url = URL(string: "http:swatshawls.com/loyly/assets/uploads/\(img)")
                
                var picture = String(describing: self.json["data"][Int(row.0)!]["picture"])
//                print (id)
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
