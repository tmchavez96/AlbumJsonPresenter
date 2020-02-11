//
//  CollectionController.swift
//  cc2
//
//  Created by Taylor Chavez on 2/11/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit

class CollectionController: UIViewController {
    var avm:albumViewModel!
    
    @IBOutlet weak var collectionTable: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        avm.colDelegate = self
        // Do any additional setup after loading the view.
    }
    
}

extension CollectionController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avm.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionTable.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        let cellAlbum = avm.albums[indexPath.row]
        httpHandler.shared.getImage(cellAlbum.thumbnailUrl ?? "") { [weak cell] img in
            cell?.cellImage.image = img
        }
        cell.layer.cornerRadius = 30.0
        cell.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        cell.layer.borderWidth = 4
        return cell
    }
}

extension CollectionController: UICollectionViewDelegateFlowLayout {
    
    //handles size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    //handles touch events
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        detailVC.curAlbum = avm.albums[indexPath.row]
        navigationController?.view.backgroundColor = .white
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 40, bottom: 30, right: 40)
    }
    
}

//MARK: Song Delegate
extension CollectionController: loadedDelegate {
    func updateView() {
        DispatchQueue.main.async {
            self.collectionTable.reloadData()
        }
    }
}
