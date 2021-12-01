//
//  DetailsViewController.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 13/11/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    var myContent : String?
    var firstName : String?
    var lastName : String?
    //...
    @IBOutlet weak private var lb_myLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lb_myLabel.text = myContent
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
