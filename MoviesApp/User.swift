//
//  UserData.swift
//  MoviesApp
//
//  Created by roua alsahli on 29/08/1444 AH.
//

import Foundation

struct User: Codable {
    let id, firstName, lastName, password: String
    let email, profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case password, email
        case profileImage = "profile_image"
    }
}
