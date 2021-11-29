//
//  PickersExampleViewController.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 27/11/2021.
//

import UIKit

class PickersExampleViewController: UIViewController {

    
    @IBOutlet weak  var txt_dateOfBirth : UITextField!
    @IBOutlet weak  var txt_whatever : UITextField!
    var myDatePicker = UIDatePicker()
    let items = ["ABC", "123", "!@#"]
    var myPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myDatePicker.datePickerMode = .date
        myDatePicker.preferredDatePickerStyle = .wheels
        myDatePicker.addTarget(self, action: #selector(datePickerDidChange(_:)), for: .valueChanged)
        
        txt_dateOfBirth.inputView = myDatePicker
        
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        txt_dateOfBirth.inputAccessoryView = keyboardToolbar
        
        let closeButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(datePickerDismiss(_:)))
        keyboardToolbar.setItems([closeButton], animated: false)
        
        
        myPicker.dataSource = self
        myPicker.delegate = self
        txt_whatever.inputView = myPicker
        txt_whatever.inputAccessoryView = keyboardToolbar
        
    }
    
    @objc func datePickerDismiss(_ sender : UIBarButtonItem){
//        txt_dateOfBirth.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    @objc func datePickerDidChange(_ sender : UIDatePicker){
        let selectedDate = sender.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd MMM yyyy"
        //dd : Day e.g. 27
        //MM : Month    e.g. 11
        //yy : Year     e.g. 2021
        //ss : Seconds  e.g. 43
        //mm : minutes  e.g. 25
        //hh : hours(12)    e.g. 8
        //HH : hours(24)    e.g. 8
        //MMM: Month Short name : Nov
        //MMMM: Month Name : November
        //EEE : Day short name : Sa.
        //EEEE: Day Name : Saturday
        //a : (am/pm)
        
        txt_dateOfBirth.text = dateFormatter.string(from: selectedDate)
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


extension PickersExampleViewController : UIPickerViewDataSource, UIPickerViewDelegate {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (row == 0){
            return "Please make a choice"
        }
        return items[row-1]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (row == 0){
            txt_whatever.text = ""
        }else{
            txt_whatever.text = items[row - 1]
        }
    }
    
    
}
