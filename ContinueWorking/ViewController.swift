//
//  ViewController.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 08/11/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak private var txt_myTextfield : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "grayScreenSegue"{
            
            if txt_myTextfield.text!.isEmpty {
            //Create the message box
            let alertMessage = UIAlertController(title: "Something went wrong", message: "The text field is empty", preferredStyle: .alert)
            
            //Create the OK button
            let okButton = UIAlertAction(title: "OK", style: .default, handler: { action in
                print("ok button clicked")
            })
            
            //Add the OK button to the Message Box
            alertMessage.addAction(okButton)
            
            //Show the message box
            present(alertMessage, animated: true)
                return false
            }
            
            return true
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailsViewController{
            if segue.identifier == "grayScreenSegue"{
                vc.myContent = txt_myTextfield.text
            }else{
                vc.myContent = "Static Text"
            }
        }
    }
    
    
    @IBAction func doSomething(_ sender : UIButton){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondScreen") as? DetailsViewController, !(txt_myTextfield.text!.isEmpty)
        else {
            //Create the message box
            let alertMessage = UIAlertController(title: "Something went wrong", message: "The text field might be empty", preferredStyle: .alert)
            
            //Create the OK button
            let okButton = UIAlertAction(title: "OK", style: .default, handler: { action in
                print("ok button clicked")
            })
            
            //Add the OK button to the Message Box
            alertMessage.addAction(okButton)
            
            //Show the message box
            present(alertMessage, animated: true)
            return }
        
            vc.myContent = txt_myTextfield.text
            self.present(vc, animated: true)
        
    }
    
}

