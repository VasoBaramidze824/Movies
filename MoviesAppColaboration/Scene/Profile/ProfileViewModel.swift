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
    weak var delegate: ProfileViewModelDelegate?
    
    func viewDidLoad() {
        fetchProfileDetails()
    }
    
    private func fetchProfileDetails() {
        //TODO: - Fetch info here
    }
}
