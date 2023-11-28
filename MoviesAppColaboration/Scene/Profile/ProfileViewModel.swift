//
//  ProfileViewModel.swift
//  MoviesAppColaboration
//
//  Created by Nana Jimsheleishvili on 28.11.23.
//

import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func profileDetailsFetched(_ details: ProfileDetails)
    func showError(_ error: Error)
}

protocol ProfileViewModel {
    var delegate: ProfileViewModelDelegate? { get set }
    func viewDidLoad()
}

final class DefaultProfileViewModel: ProfileViewModel {
    private let url = "https://run.mocky.io/v3/46165561-f3f6-4eac-b09d-3009d8237c62?fbclid=IwAR3c1lwwS8EyiU3OCg9O68Nyqep1z4NMhUfkusUHLrH0s1dvqOr5owORgRE"
    private let networkManager: NetworkService
    
    weak var delegate: ProfileViewModelDelegate?
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
    func viewDidLoad() {
        fetchProfileDetails()
    }
    
    private func fetchProfileDetails() {
        guard let profileUrl = URL(string: url) else { return }
        networkManager.request(with: profileUrl) { [weak self] (result: Result<ProfileResponse, Error>) in
            switch result {
            case .success(let response):
                self?.delegate?.profileDetailsFetched(response.profile)
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
