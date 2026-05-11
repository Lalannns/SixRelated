//
//  DataManager.swift
//  SixRelated
//
//  Created by Allan Auezkhan on 11.05.2026.
//

import Foundation
import Combine

class DataManager: ObservableObject {
    @Published var albums: [Album] = []
    @Published var artists: [Artist] = []
    
    init() {
        loadAlbums()
        loadArtists()
    }
    
    func loadAlbums() {
        guard let url = Bundle.main.url(forResource: "albums", withExtension: "json") else {
            print("Failed to locate albums.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Album].self, from: data)
            self.albums = decoded.sorted { $0.releaseYear < $1.releaseYear }
        } catch {
            print("Failed to decode albums.json: \(error.localizedDescription)")
        }
    }
    
    func loadArtists() {
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            print("Failed to locate artists.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Artist].self, from: data)
            self.artists = decoded
        } catch {
            print("Failed to decode artists.json: \(error.localizedDescription)")
        }
    }
    
    func artist(for id: String) -> Artist? {
        artists.first { $0.id == id }
    }
    
    func featuredArtistsFor(album: Album) -> [Artist] {
        album.featuredArtists.compactMap { artist(for: $0) }
    }
}
