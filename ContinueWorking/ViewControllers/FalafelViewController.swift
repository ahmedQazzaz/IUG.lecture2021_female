//
//  FalafelViewController.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 11/12/2021.
//

import UIKit

class FalafelViewController : UIViewController {
    
    @IBOutlet weak private var lb_timer: UILabel!
    @IBOutlet weak private var btn_start : UIButton!
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let initialDate = UserDefaults.standard.object(forKey: "timerStart") as? Date {
            btn_start.isEnabled = false
            self.counter(initialDate)
        }
    }
    
    
    @IBAction func startAction(_ sender : Any?) {
        let initialDate = Date()
        UserDefaults.standard.set(initialDate, forKey: "timerStart")
        btn_start.isEnabled = false
        lb_timer.text = ""
        self.counter(initialDate)
    }
    
    func counter(_ initialDate : Date){
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { t in
            let difference = Int(Date().timeIntervalSince1970 - initialDate.timeIntervalSince1970)
//            let hours = difference / 3600
            let minutes = (difference / 60) % 60
            let seconds = difference % 60
            self.lb_timer.text = "\(minutes):\(seconds)"
            
            if(minutes >= 5){
                UserDefaults.standard.removeObject(forKey: "timerStart")
                self.timer?.invalidate()
                self.timer = nil
                self.btn_start.isEnabled = true
                self.lb_timer.text = ""
            }
        })
    }
    
    
}
