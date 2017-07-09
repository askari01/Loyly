//
//  EssentialOilsVC.swift
//  Loyly
//
//  Created by Syed Askari on 7/6/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class EssentialOilsVC: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var oils = [Oils]()
    var filteredOils = [Oils]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // table view
        tableView.delegate = self
        tableView.dataSource = self
        
        // search bar
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search
        
        parseOilCSV()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseOilCSV() {
        let path = Bundle.main.path(forResource: "oils", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            // printing
            print (rows)
            
            for row in rows {
                let oilNameOil = row["name"]!
                let botanicalNameOil = row["botanicalName"]!
                let plantFamilyOil = row["plantFamily"]!
                let originOil = row["origin"]!
                let noteOil = row["note"]!
                let effectOil = row["effect"]!
                
                let oil = Oils(name: oilNameOil, botanicalName: botanicalNameOil, plantFamily: plantFamilyOil, origin: originOil, note: noteOil, effect: effectOil)
                oils.append(oil)
            }
            
            
        } catch let err as NSError {
            print(err.debugDescription)
            
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredOils.count
        }
        
        return oils.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OilCell {
        
            let oil: Oils!
            if inSearchMode {
                oil = filteredOils[indexPath.row]
                cell.configureCell(oil)
            } else {
                oil = oils[indexPath.row]
                cell.configureCell(oil)
            }
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var oil: Oils!
        
        if inSearchMode {
            oil = filteredOils[indexPath.row]
        } else {
            oil = oils[indexPath.row]
        }
        
//        to be done
        performSegue(withIdentifier: "oilDetails", sender: oil)
    }
    
    func searchButtonPressed() {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            tableView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            
            filteredOils = oils.filter({$0.name.range(of: lower) != nil})
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oilDetails" {
            if let detailsVC = segue.destination as? OilDetailVC {
                if let oil = sender as? Oils {
                    detailsVC.oil = oil
                }
            }
        }
    }
    
}
