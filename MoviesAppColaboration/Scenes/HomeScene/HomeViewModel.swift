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
        let moviewsURLStirng: String = "https://api.themoviedb.org/3/movie/popular?api_key=2c4048c6f599fb101b867ea41bf01c69"
        //TODO: Use netwok layer by sandro
        
        delegate?.moviesFetched(MoviesResponse.mockMovies)
        
        Network().request(with: URL(string: moviewsURLStirng)!) { (result: Result<MoviesResponse, Error>) in
            switch result {
            case .success(let success):
                self.delegate?.moviesFetched(success.results)
            case .failure(let failure):
                break
            }
        }
    }
}
