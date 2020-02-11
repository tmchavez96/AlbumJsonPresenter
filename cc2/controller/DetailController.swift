//
//  DetailController.swift
//  cc2
//
//  Created by Taylor Chavez on 2/11/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    var curAlbum:album?
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailTitle: UILabel!
    
    
    @IBOutlet weak var detailAlbumID: UILabel!
    
    
    @IBOutlet weak var detailSongID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

    func setup(){
        httpHandler.shared.getImage(curAlbum?.url ?? "") { [weak self] img in
            self?.detailImage.image = img
        }
        detailTitle.text = curAlbum?.title
        detailAlbumID.text = String(curAlbum?.albumId ?? -1)
        detailSongID.text = String(curAlbum?.id ?? -1)
    }
}
