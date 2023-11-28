//
//  MoviesResponse.swift
//  MoviesAppColaboration
//
//  Created by Baramidze on 28.11.23.
//

import Foundation

struct MoviesResponse: Decodable {
    
    let results: [Movie]
    
    static let mockMovies = [
        Movie(id: 1, title: "ფილმი 1", posterPath: ""),
        Movie(id: 2, title: "ფილმი 2", posterPath: ""),
        Movie(id: 3, title: "ფილმი 3", posterPath: "")
    ]
}
