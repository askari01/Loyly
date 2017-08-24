//
//  EducationVC.swift
//  Loyly
//
//  Created by Syed Askari on 8/23/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import GradientLoadingBar

class EducationVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var count = 0
    var educations = [Education]()
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
        var education: Education!
        education = educations[indexPath.row]
        performSegue(withIdentifier: "educationDetails", sender: education)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EducationCell {
            // print (indexPath.row)
            var level = String(describing: self.json[indexPath.row]["level"])
            print ("Level: \(level)")
            var flanguage = String(describing: self.json[indexPath.row]["flanguage"])
            print ("flanguage: \(flanguage)")
            var wearDate = String(describing: self.json[indexPath.row]["wear_date"])
            print ("wearDate: \(wearDate)")
            cell.tag = indexPath.row
            var img = String(describing: self.json[indexPath.row]["picture"])
            let url = URL(string: "http:swatshawls.com/loyly/assets/uploads/\(img)")
            print ("url: \(url)")
            
            cell.setValues(level: level, flanguage: flanguage, wearDate: wearDate, picture1: url!)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "educationDetails" {
            if let detailsVC = segue.destination as? EducationDetailVC {
                if let education = sender as? Education {
                    detailsVC.education = education
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getData() {
        loadingBar.show()
        var url: String = "http://swatshawls.com/loyly/Apis/education"
        
        Alamofire.request(url).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                self.json = JSON(response.result.value)
                self.educations.removeAll()
                print (self.json[0]["picture"])
            }
            self.count = self.json.count
            self.tableView.reloadData()
            
            print (self.json.count)
            
            for row in self.json {
                print ("Image Count: \(self.image.count)")
                var id = String(describing: self.json[Int(row.0)!]["id"])
                print ("ID: \(id)")
                var level = String(describing: self.json[Int(row.0)!]["level"])
                print ("Level: \(level)")
                var nextDate = String(describing: self.json[Int(row.0)!]["next_date"])
                print ("nextDate: \(nextDate)")
                var flanguage = String(describing: self.json[Int(row.0)!]["flanguage"])
                print ("flanguage: \(flanguage)")
                var wearDate = String(describing: self.json[Int(row.0)!]["wear_date"])
                print ("wearDate: \(wearDate)")
                var llanguage = String(describing: self.json[Int(row.0)!]["llanguage"])
                print ("llanguage: \(llanguage)")
                var description = String(describing: self.json[Int(row.0)!]["description"])
                print ("description: \(description)")
                var topic = String(describing: self.json[Int(row.0)!]["topic"])
                print ("topic: \(topic)")
                var img = String(describing: self.json[Int(row.0)!]["picture"])
                print ("img: \(img)")
                let url = URL(string: "http:swatshawls.com/loyly/assets/uploads/\(img)")
                print ("url: \(url)")
                
                var picture = String(describing: self.json[Int(row.0)!]["picture"])
                print (picture)
                
                let education = Education(id: id, level: level, nextDate: nextDate, flanguage: flanguage, wearDate: wearDate, llanguage: llanguage, description: description, topic: topic, picture: url!)
                print ("EDUCATION: \(education)")
                self.educations.append(education)
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
