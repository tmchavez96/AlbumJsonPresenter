//
//  albumViewModel.swift
//  cc2
//
//  Created by Taylor Chavez on 2/11/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import Foundation


protocol loadedDelegate: class {
    func updateView()
}

class albumViewModel {
    weak var listDelegate: loadedDelegate?
    weak var colDelegate: loadedDelegate?
    var albums:[album] = [] {
        didSet{
            listDelegate?.updateView()
            colDelegate?.updateView()
        }
    }
    
    init(){
        httpHandler.shared.getAlbums { [weak self] results in
            self?.albums = results
            
        }
    }
    
    func getAlbums() -> [album]{
        return albums
    }
}
