//
//  Models.swift
//  SixRelated
//
//  Created by Allan Auezkhan on 11.05.2026.
//

struct Album: Codable, Identifiable {
    let id: String
    let name: String
    let releaseYear: Int
    let releaseDate: String
    let description: String
    let coverArt: String
    let tracks: Int
    let featuredArtists: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case releaseYear = "release_year"
        case releaseDate = "release_date"
        case description
        case coverArt = "cover_art"
        case tracks
        case featuredArtists = "featured_artists"
    }
}


struct Artist: Codable, Identifiable {
    let id: String
    let name: String
    let role: String // e.g., "Vocalist", "Producer", "Featured Artist"
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case role
    }
}
