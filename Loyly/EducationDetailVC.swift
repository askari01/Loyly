//
//  EducationDetailVC.swift
//  Loyly
//
//  Created by Syed Askari on 8/24/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class EducationDetailVC: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var flanguage: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var llanguage: UILabel!
    @IBOutlet weak var wearDate: UILabel!
    @IBOutlet weak var desc: UITextView!
    var education: Education!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picture.kf.setImage(with: education.picture)
        level.text = education.level
        flanguage.text = education.flanguage
        time.text = education.nextDate
        topic.text = education.topic
        llanguage.text = education.llanguage
        wearDate.text = education.wearDate
        desc.text = education.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
