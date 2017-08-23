//
//  AgfussDetailVC.swift
//  Loyly
//
//  Created by Syed Askari on 8/15/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class AgfussDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tag: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var ingredient: UITableView!
    @IBOutlet weak var instruction: UITableView!
    
    var agfuss: Agfuss!
    var ing = [String]()
    var ingCount: Int = 0
    
    var ins = [String]()
    var insCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ingredient.delegate = self
        ingredient.dataSource = self
        instruction.delegate = self
        instruction.dataSource = self
        
        print(agfuss)
        image.kf.setImage(with: agfuss.picture)
        name.text = agfuss.title
        tag.text = agfuss.tag
        time.text = agfuss.time
        let characters = agfuss.ingredients.components(separatedBy: ",")
        ingCount = characters.count
        for char in characters {
            ing.append(char)
            print (char)
        }
        
        let characters1 = agfuss.steps.components(separatedBy: ",")
        insCount = characters1.count
        for char in characters1 {
            ins.append(char)
            print (char)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ingredient {
            print ("ING: \(ingCount)")
            return ingCount
        } else if tableView == instruction {
            print ("INS: \(insCount)")
            return insCount
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if tableView == ingredient {
            cell = tableView.dequeueReusableCell(withIdentifier: "ing", for: indexPath)
            cell.textLabel?.text = ing[indexPath.row]
        } else if tableView == instruction {
            cell = tableView.dequeueReusableCell(withIdentifier: "ins", for: indexPath)
            cell.textLabel?.text = ins[indexPath.row]
        }
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
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
