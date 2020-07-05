//
//  Networking.swift
//  TheMovieDB
//
//  Created by Duale on 7/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
import Foundation

/* Networking functionaliy for grapping the Model subject to Codable Protocool */
class Networking {

    func response (url: String  , completion: @escaping (Movies) -> ()) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url, completionHandler: { (data , response , error ) in
            self.urlCompletionHandler(data: data, response: response, error: error, completion: completion)
            }).resume()
    }
    
    func urlCompletionHandler (data: Data?  , response : URLResponse? , error : Error? , completion: (Movies) -> ()) {
        guard let data = data else {return}
        do {
            let jsondecoder = JSONDecoder()
            let movies = try jsondecoder.decode(Movies.self, from: data)
            completion(movies)
        
        } catch {
            print("Error \(error)")
        }
    }

}
