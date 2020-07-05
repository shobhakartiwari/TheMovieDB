//
//  UrlPath.swift
//  TheMovieDB
//
//  Created by Duale on 7/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
import UIKit
/*Singleton Class for storing the urlPath and Image Path */
class UrlPath {
   static let path = UrlPath()
   private init () {}
   var api_url_path = "https://api.themoviedb.org/3/discover/movie?api_key="
   var image_url_path = "https://image.tmdb.org/t/p/w500"
   var API_KEY = "c91ed3a7a344459eccad9687acf0d07e"
   func sharePathUrl()->String {
       return api_url_path + API_KEY
   }
   func sharePathImg()->String {
       return image_url_path
   }
    
    
}

