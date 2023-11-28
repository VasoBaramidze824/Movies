//
//  HomeViewModel.swift
//  MoviesAppColaboration
//
//  Created by Baramidze on 28.11.23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func moviesFetched(_ movies: [Movie])
}

final class HomeViewModel {
    
    private var movies: [Movie]?
    
    weak var delegate: HomeViewModelDelegate?
    
    func viewDidLoad() {
        fetchMovies()
    }
    
    private func fetchMovies() {
        //TODO: Use netwok layer by sandro
        delegate?.moviesFetched(MoviesResponse.mockMovies)
    }
}
