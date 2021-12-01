//
//  TestCollectionViewController.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 01/12/2021.
//

import UIKit

class TestCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    

    
    //@IBOutlet weak private var myCollection : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 10
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thing", for: indexPath)
        
        return cell ?? UICollectionViewCell()
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
