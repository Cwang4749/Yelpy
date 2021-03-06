//
//  File.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation


struct API {
    

    
    static func getRestaurants(completion: @escaping ([Restaurant]?) -> Void) {
        
        //Client ID: FdzpByR-8gT59K7bUCpNvA
        
        // ––––– TODO: Add your own API key!
        let apikey = "UeiWdyQ25K1Ys-NSOiXI6E77RZnnQwzJjG3AAQPRQrTqy1yUfLdZf_Y2B5iyUmxTEfpkfxfS3IYr3VAlRaxbc8gyPD72b6mklDwTZmVyw9sE_ECr0Ee-4rzHo35GYHYx"
        
        // Coordinates for San Francisco
        let lat = 37.773972
        let long = -122.431297
        
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
        

                // ––––– TODO: Get data from API and return it using completion
                print(data)
                
                //convert json to dictionary:
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                //grab businesses data and convert it to an array of dictionaries for each restaurant
                let restDictionaries = dataDictionary["businesses"] as! [[String:Any]]
                
                var restaurants: [Restaurant] = []
                
                for dictionary in restDictionaries {
                    let restaurant = Restaurant.init(dict: dictionary)
                    restaurants.append(restaurant)
                }
                
                //completion is an escaping method that allows data to be used outside of a closure
                return completion(restaurants)
                
                }
            }
        
            task.resume()
        
        }
    }

    
