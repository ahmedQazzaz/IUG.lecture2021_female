//
//  AddItemViewController.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 20/11/2021.
//

import UIKit

class AddItemViewController: UIViewController {

    var delegate : AddItemDelegate?
    @IBOutlet weak var my_text : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addAction(_ sender : UIButton){
        self.delegate?.itemDidAdd(my_text.text ?? "")
    }

}



protocol AddItemDelegate : NSObjectProtocol{
    func itemDidAdd(_ item: String)
}
