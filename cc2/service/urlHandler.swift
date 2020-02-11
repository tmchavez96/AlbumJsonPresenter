//
//  urlHandler.swift
//  cc2
//
//  Created by Taylor Chavez on 2/11/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import Foundation

//dont really need a class for this, but should follow best practices
class urlHandler{
    
    static var base = "https://jsonplaceholder.typicode.com/photos"
    
    static func getRequestURL() -> String{
        return base
    }
}
