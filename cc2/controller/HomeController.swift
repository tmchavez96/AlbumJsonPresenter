//
//  ViewController.swift
//  cc2
//
//  Created by Taylor Chavez on 2/11/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    var avm: albumViewModel = albumViewModel()
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var collectionView: UIView!
    var toggleBool = false
    @IBAction func didToggle(_ sender: Any) {
        toggleBool = !toggleBool
        switchView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchView()
        // Do any additional setup after loading the view.
    }
    
    func switchView(){
        listView.isHidden = toggleBool;
        collectionView.isHidden = !toggleBool;
    }
    
    //pass view model to containers via segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListSegue" {
            
            let listVC = segue.destination as! ListController
            listVC.avm = avm
        } else if segue.identifier == "GridSegue" {
            
            let gridVC = segue.destination as! CollectionController
            gridVC.avm = avm
        }
    }


}

