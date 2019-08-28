//
//  Playlists.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 26/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation

class Playlist {
    
    var tituloDaPlaylist: String
    var capaDaPlaylist: String
    var urlDaPlaylist: String
    
    init(tituloDaPlaylist: String, capaDaPlaylist: String, urlDaPlaylist: String) {
        self.tituloDaPlaylist = tituloDaPlaylist
        self.capaDaPlaylist = capaDaPlaylist
        self.urlDaPlaylist = urlDaPlaylist
    }
}
