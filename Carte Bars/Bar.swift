//
//  Bar.swift
//  Carte Bars
//
//  Created by Renaud Descours on 08/04/2016.
//  Copyright © 2016 Renaud Descours. All rights reserved.
//

import UIKit

class Bar{
    
    // MARK: Properties
    
    var id: Int
    var name: String
    var adress: String
    var url: String
    var tags:String
    var longitude: Double
    var latitude: Double
    var photo: UIImage?
    var image_url: String
    
    // MARK: Initialiser
    
    init?(id: Int, name: String, adress: String, url: String, image_url: String, tags:String, longitude: Double, latitude: Double){
        self.image_url=image_url
        self.id=id
        self.name=name
        self.adress=adress
        self.url=url
        self.photo=nil
        self.tags=tags
        self.longitude=longitude
        self.latitude=latitude
        
        if(id==0 || name.isEmpty || adress.isEmpty || url.isEmpty || tags.isEmpty || longitude==0 || latitude==0){
            return nil
        }
    }
    
    func setPhoto(){
        let urlImage = NSURL(string: image_url)!
        let data = NSData(contentsOfURL : urlImage)
        let photo = UIImage(data : data!)!
        self.photo = photo
    }
}
