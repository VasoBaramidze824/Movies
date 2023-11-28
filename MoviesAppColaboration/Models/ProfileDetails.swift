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
    let id: Int
    let firstName, lastName: String
    let age: Int
    let gender, email, phone: String
    let address: Address
    let bio: String
    let profilePictureURL: String
    let socialMedia: SocialMedia

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, age, gender, email, phone, address, bio
        case profilePictureURL = "profilePictureUrl"
        case socialMedia
    }
}

// MARK: - Address
struct Address: Decodable {
    let street, city, state, country: String
    let zipCode: String
}

// MARK: - SocialMedia
struct SocialMedia: Decodable {
    let linkedin, twitter, facebook: String
}

