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
            print (rows)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
}
