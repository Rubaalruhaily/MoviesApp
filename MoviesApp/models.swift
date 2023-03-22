//
//  models.swift
//  MoviesApp
//
//  Created by Ruba on 30/08/1444 AH.
//

import Foundation
    struct Movies: Codable {
        let id, movieName: String
        let moviePoster: String
        let movieStory, movieDuration: String
        let movieGenres: [String]
        let movieWatcherType: String
        let movieIMDBRate: Double
        let movieLanguage: String

    enum CodingKeys: String, CodingKey {
        case id
        case movieName = "movie_name"
        case moviePoster = "movie_poster"
        case movieStory = "movie_story"
        case movieDuration = "movie_duration"
        case movieGenres = "movie_genres"
        case movieWatcherType = "movie_watcher_type"
        case movieIMDBRate = "movie_IMDb_rate"
        case movieLanguage = "movie_language"
    }
    }
