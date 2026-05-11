//
//  AlbumsListView.swift
//  SixRelated
//
//  Created by Allan Auezkhan on 11.05.2026.
//

import SwiftUI

struct AlbumsListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var sortByYear = true
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.albums) { album in
                    NavigationLink(destination: AlbumDetailView(album: album)) {
                        HStack(spacing: 12) {
                            // Album Cover Art
                            Image(album.coverArt)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                                .clipped()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(album.name)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text(String(format: "%d", album.releaseYear))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                
                                Text("\(album.tracks) tracks")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "music.note")
                                .foregroundColor(.blue)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Drake's Studio Albums")
        }
    }
}

#Preview {
    AlbumsListView()
        .environmentObject(DataManager())
}
