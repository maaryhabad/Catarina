//
//  PlaylistModel.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 26/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit

class PlaylistModel {
    static let instance = PlaylistModel()
    
    private init(){
        
    }
    
    var playlists : [Playlist]  = [
        Playlist(tituloDaPlaylist: "Hora de comer", capaDaPlaylist: "comer.png", urlDaPlaylist: "https://open.spotify.com/playlist/21smDrp37ODWQTBSmC0amA?si=-IQx5ooDTda9adzp3O4t9g"),
        Playlist(tituloDaPlaylist: "Hora de dormir", capaDaPlaylist: "sono.png", urlDaPlaylist: "https://open.spotify.com/playlist/2tnorVose957pJOoVlKtbj?si=5GV89snmSw65lIYWiEk-KQ"),
        Playlist(tituloDaPlaylist: "Hora de tomar banho", capaDaPlaylist: "banho.png", urlDaPlaylist: "https://open.spotify.com/playlist/21y7fSef1jMv2dDgq9YEFE?si=zxJKsGufQI6qyLubNF-M2Q"),
        Playlist(tituloDaPlaylist: "Hora de acalmar", capaDaPlaylist: "acalmar.png", urlDaPlaylist: "https://open.spotify.com/playlist/21y7fSef1jMv2dDgq9YEFE?si=dabl2dLgT2G4VvDk2wdwbA"),
        Playlist(tituloDaPlaylist: "Hora de brincar", capaDaPlaylist: "brincar.png", urlDaPlaylist: "https://open.spotify.com/playlist/19aWkGZnnZnY8b1Xu9HD9H?si=51QOL0wGReqrbanP22Is1g"),
        Playlist(tituloDaPlaylist: "Hora de estimular", capaDaPlaylist: "estimulo.png", urlDaPlaylist: "https://open.spotify.com/playlist/0UrkvzVhL4m29UTSh7v4SK?si=XU-doQG4T1u0QTZ0Kq9cHA"),
        Playlist(tituloDaPlaylist: "Minha família", capaDaPlaylist: "familia.png", urlDaPlaylist: "https://open.spotify.com/playlist/5z4TWPFShHIxJ7x6mdxZAE?si=J2vfsB6QSrukOFff4RyHlg")
        
    ]
}
