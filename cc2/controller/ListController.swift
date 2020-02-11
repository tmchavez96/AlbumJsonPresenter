//
//  ListController.swift
//  cc2
//
//  Created by Taylor Chavez on 2/11/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit

class ListController: UIViewController {
    var avm:albumViewModel!
    
    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avm.listDelegate = self
    }
    
    
}

extension ListController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(avm.albums.count)
        return avm.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        let cellAlbum = avm.albums[indexPath.row]
        cell.listTable.text = cellAlbum.title
        httpHandler.shared.getImage(cellAlbum.thumbnailUrl ?? "https://i.kym-cdn.com/entries/icons/original/000/000/091/TrollFace.jpg") { [weak cell] uiImage in
            cell?.listImage.image = uiImage
        }
        return cell
    }
    
    
}

extension ListController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        detailVC.curAlbum = avm.albums[indexPath.row]
        
        navigationController?.view.backgroundColor = .white //remove black flicker on top right
        navigationController?.pushViewController(detailVC, animated: true) //push onto the stack
    }
    
}

//MARK: Song Delegate
extension ListController: loadedDelegate {
    func updateView() {
        DispatchQueue.main.async {
            self.listTable.reloadData()
        }
    }
}
