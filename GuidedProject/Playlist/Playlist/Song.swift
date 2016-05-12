//
//  Song.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class Song: Equatable {
    
    private let keyTitle = "title"
    private let keyArtist = "artist"
    
    let title: String
    let artist: String
    
    var dictionaryCopy: [String: AnyObject] {
        return [keyTitle: title, keyArtist: artist]
    }
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[keyTitle] as? String, artist = dictionary[keyArtist] as? String else {
            return nil
        }
        self.title = title
        self.artist = artist
    }
}

func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.title == rhs.title && lhs.artist == rhs.artist
}

