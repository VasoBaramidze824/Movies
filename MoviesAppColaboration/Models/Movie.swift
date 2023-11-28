//
//  Movie.swift
//  MoviesAppColaboration
//
//  Created by Baramidze on 28.11.23.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
    }
}
