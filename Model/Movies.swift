//
//  Movies.swift
//  TheMovieDB
//
//  Created by Duale on 7/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
import Foundation
struct Movies : Codable {
    var results : [Movie]
}

struct Movie : Codable  {
    var popularity : Double
    var vote_count : Int
    var video : Bool
    var poster_path : String
    var id : Int
    var adult : Bool
    var backdrop_path : String
    var original_language : String
    var original_title : String
    var genre_ids : [Int]
    var title : String
    var vote_average : Double
    var overview : String
    var release_date : String
   
}
