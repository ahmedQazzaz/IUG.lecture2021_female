//
//  ExampleViewController.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 17/11/2021.
//

import UIKit

class ExampleViewController: UIViewController {

    
    var myData : [String:[String]] = ["Food": ["Apple", "orange", "banana"],
                                      "People": ["Ahmed", "Mohammed"],
                                      "Animal":["Cat", "bird", "dog", "lion", "mouse"],
                                      "something":["a","b","c","d","e","f","g","h","i","j","k"]]
    var selectedCell : IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddItemViewController {
            vc.delegate = self
        }
    }

}

extension ExampleViewController : AddItemDelegate {
    
    func itemDidAdd(_ item: String) {
        print(item)
    }
    
    
}

extension ExampleViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = Array(myData.keys)
        let key = keys[section]
        let arr = myData[key] ?? []
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TempTableViewCell") as? TempTableViewCell
        let keys = Array(myData.keys)
        let key = keys[indexPath.section]
        let arr = myData[key] ?? []
        
        cell?.lb_title.text = arr[indexPath.row]
        cell?.lb_title.textColor = .black
        if (selectedCell == indexPath){
            cell?.lb_title.textColor = .red
        }
        
        
        return cell ?? UITableViewCell()
    }
      
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let keys = Array(myData.keys)
        let key = keys[section]
        
        return key
    }
    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "end of section #\(section)"
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TempTableViewCell
        cell?.lb_title.textColor = .red
        selectedCell = indexPath
        
    }
    
    
}
