//
//  ChartVC.swift
//  Loyly
//
//  Created by Syed Askari on 7/11/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class ChartVC: UIViewController, UIWebViewDelegate {

    var choice: String?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.delegate = self
        var res: String?
        var ext: String?
//        print (choice!)
        switch choice! {
        case "1":
            res = "eo_instruction_a3_en-min"
            ext = "pdf"
        case "2":
            res = "harmonized_blending_a3_en-min"
            ext = "pdf"
        case "3":
            res = "caution_a3-min"
            ext = "pdf"
        default:
            res = ""
            return
        }
        
//        print (choice! + ext!)
        
        if let url = Bundle.main.url(forResource: res!, withExtension: ext!) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        print(choice)
//        if let url = Bundle.main.url(forResource: "eo_instruction_a3_en-min", withExtension: "pdf") {
//            let request = URLRequest(url: url)
//            webView.loadRequest(request)
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
