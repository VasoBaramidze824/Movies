//
//  ProfileDetails.swift
//  MoviesAppColaboration
//
//  Created by Nana Jimsheleishvili on 28.11.23.
//

import Foundation

// MARK: - Welcome
struct ProfileResponse: Decodable {
    let profile: ProfileDetails
}

// MARK: - Profile
struct ProfileDetails: Decodable {
    let firstName: String?
    let lastName: String?
    let bio: String?
}
