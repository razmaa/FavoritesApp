//
//  MusicModel.swift
//  FavSongsApp
//
//  Created by nika razmadze on 29.10.23.
//
import UIKit

class Music {
    let name: String
    let artist: String
    let image: UIImage
    
    init(name: String, artist: String, image: UIImage) {
        self.name = name
        self.artist = artist
        self.image = image
    }
    
    static var musics = [
        Music(name: "Iavnana", artist: "Deda", image: UIImage(named: "iavnana")!),
        Music(name: "lose Yourself", artist: "Eminem", image: UIImage(named: "Lose_yourself")!),
        Music(name: "Stan", artist: "Eminem", image: UIImage(named: "Stan")!),
        Music(name: "Mockingbird", artist: "Eminem", image: UIImage(named: "Mockingbird")!),
        Music(name: "lose Yourself", artist: "Eminem", image: UIImage(named: "Lose_yourself")!),
        Music(name: "lose Yourself", artist: "Eminem", image: UIImage(named: "Lose_yourself")!),
        Music(name: "Stan", artist: "Eminem", image: UIImage(named: "Stan")!),
        Music(name: "Iavnana", artist: "Deda", image: UIImage(named: "iavnana")!),
        Music(name: "Iavnana", artist: "Deda", image: UIImage(named: "iavnana")!),
        Music(name: "Mockingbird", artist: "Eminem", image: UIImage(named: "Mockingbird")!),
        Music(name: "Mockingbird", artist: "Eminem", image: UIImage(named: "Mockingbird")!),
        Music(name: "lose Yourself", artist: "Eminem", image: UIImage(named: "Lose_yourself")!)
    ]
}

