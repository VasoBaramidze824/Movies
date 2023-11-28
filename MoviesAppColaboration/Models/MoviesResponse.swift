//
//  MoviesResponse.swift
//  MoviesAppColaboration
//
//  Created by Baramidze on 28.11.23.
//

import Foundation

struct MoviesResponse: Decodable {
    
    let results: [Movie]
}
