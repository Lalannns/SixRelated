//
//  AlbumDetailView.swift
//  SixRelated
//
//  Created by Allan Auezkhan on 11.05.2026.
//

import SwiftUI

struct AlbumDetailView: View {
    @EnvironmentObject var dataManager: DataManager
    let album: Album
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Album Cover Placeholder
                // Album Cover
                if !album.coverArt.isEmpty {
                    Image(album.coverArt)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(40)
                        .cornerRadius(12)
                } else {
                    Image(systemName: "music.note.house.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding(40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                }

                
                // Album Info
                VStack(alignment: .leading, spacing: 3) {
                    Text(album.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text(String(format: "%d", album.releaseYear))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    

                        Spacer()
                        Label("\(album.tracks) tracks", systemImage: "music.note")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("About")
                        .font(.headline)
                    
                    Text(album.description)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding(.horizontal)
                
                // Featured Artists
                VStack(alignment: .leading, spacing: 12) {
                    Text("Featured Artists")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    let featuredArtists = dataManager.featuredArtistsFor(album: album)
                    
                    if featuredArtists.isEmpty {
                        Text("No featured artists")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    } else {
                        VStack(spacing: 8) {
                            ForEach(featuredArtists) { artist in
                                HStack(spacing: 12) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .frame(width: 24)
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(artist.name)
                                            .font(.body)
                                            .fontWeight(.semibold)
                                        
                                        Text(artist.role)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding(.vertical)
        }
        .navigationTitle("Album Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let dataManager = DataManager()
    AlbumDetailView(album: Album(
        id: "preview",
        name: "Take Care",
        releaseYear: 2011,
        releaseDate: "2011-11-15",
        description: "Drake's second studio album exploring themes of relationships.",
        coverArt: "take_care",
        tracks: 13,
        featuredArtists: ["artist004", "artist005"]
    ))
    .environmentObject(dataManager)
}
