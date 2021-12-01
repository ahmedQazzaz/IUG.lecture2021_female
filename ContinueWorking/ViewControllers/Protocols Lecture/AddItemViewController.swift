//
//  AddItemViewController.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 20/11/2021.
//

import UIKit

class AddItemViewController: UIViewController {

    weak var delegate : AddItemDelegate?
    
    var didAddItem : ((_ : String)->Void)?
    
    @IBOutlet weak var my_text : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addAction(_ sender : UIButton){
        //self.delegate?.itemDidAdd(my_text.text ?? "")
        self.didAddItem?(my_text.text ?? "")
    }

}



protocol AddItemDelegate : NSObjectProtocol{
    func itemDidAdd(_ item: String)
}
