//
//  GetData.swift
//  Carte Bars
//
//  Created by Renaud Descours on 11/04/2016.
//  Copyright © 2016 Renaud Descours. All rights reserved.
//

import UIKit

class GetData{
    
    // Methode for persing the JSON file, return a Bar table
    func loadBars() -> [Bar]{
        let path = NSBundle.mainBundle().pathForResource("donnees", ofType: "json")
        print("path: ", path)
        
        let filename: String = "donnees.json"
        
        var bars = [Bar]()
        
        do{
            let data = try NSData(contentsOfFile: path!, options: NSDataReadingOptions.DataReadingMapped)
            do{
                let json: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
                if let json = json as? Dictionary<String, AnyObject> {
                    
                    if let json = json as? [String: AnyObject],
                        
                        let allBars = json["bars"] as? [[String: AnyObject]] {
                        
                        var id: Int
                        var name: String
                        var adress: String
                        var url: String
                        var image_url: String
                        var tags: String
                        var latitude: Double
                        var longitude: Double
                        var count: Int = 1
                        
                        for bar in allBars {
                            print("chargement: \(count)/206")
                            count+=1
                            
                            id = (bar["id"] as? Int)!
                            name = (bar["name"] as? String)!
                            adress = (bar["address"] as? String)!
                            url = (bar["url"] as? String)!
                            image_url = (bar["image_url"] as? String)!
                            
                            // tags can get the false value in stead of a String, this allow to avoir an error
                            if let test = bar["tags"] as? String {
                                tags = (bar["tags"] as? String)!
                            }else{
                                tags=" "
                            }
                            
                            latitude = (bar["latitude"] as? Double)!
                            longitude = (bar["longitude"] as? Double)!
                            
//                            let urlImage = NSURL(string: image_url)!
//                            let data = NSData(contentsOfURL : urlImage)
//                            photo = UIImage(data : data!)!
                            
                            let nouveauBar = Bar(id: id, name: name, adress: adress, url: url,  image_url: image_url, tags: tags, longitude: longitude, latitude: latitude)!
                            
                            bars += [nouveauBar]
                        }
                    }
                    
                } else {
                    print("Level file '\(filename)' is not valid JSON")
                }
            }catch {
                print("Level file '\(filename)' is not valid JSON: \(error)")
            }
            
        }catch {
            print("Could not load level file: \(filename), error: \(error)")
        }
        
        return bars
    }
    
    
}