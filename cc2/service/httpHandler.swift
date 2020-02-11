//
//  httpHandler.swift
//  cc2
//
//  Created by Taylor Chavez on 2/11/20.
//  Copyright © 2020 Taylor Chavez. All rights reserved.
//

import UIKit


final class httpHandler{
    static var shared = httpHandler()
    private init(){}
    
    
    //MARK: get JSON from URL
    func getAlbums( closure: @escaping ([album])-> Void){
        let urlStr = urlHandler.getRequestURL()
        guard let url = URL(string: urlStr) else{
            closure([])
            return
        }
        URLSession.shared.dataTask(with: url){ (dat,_,err) in
            if let error = err{
                print(error.localizedDescription)
                closure([])
                return
            }
            
            if let data = dat{
                var albums:[album] = []
                do{
                    albums = try JSONDecoder().decode([album].self, from: data)
                }catch{
                    print(error.localizedDescription)
                }
                closure(albums)
                return
            }
            
        }.resume()
    }
    
    
    //MARK: get an image from a string url
    func getImage(_ imageUrl:String, completion: @escaping (UIImage?) -> Void){
           guard let url:URL = URL(string: imageUrl) else{
               completion(nil)
               return
           }
           URLSession.shared.dataTask(with: url){ (data,_,err) in
               if let error = err {
                   print(error.localizedDescription)
                   completion(nil)
                   return
               }
               if let myData = data {
                   let image = UIImage(data: myData)
                   DispatchQueue.main.async{
                      completion(image)
                   }
                   return
               }
               
           }.resume()
       }
}
