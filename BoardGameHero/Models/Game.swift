//
//  Games.swift
//  BoardGames
//
//  Created by Adam Schlichtmann on 4/10/24.
//

import Foundation


struct Game: Identifiable {
    var id: UUID
    var description: String
    var lastPlayed: Date
    var timesPlayed: Int
    var title: String
    
    init(id: UUID = UUID(), description: String, lastPlayed: Date, timesPlayed: Int, title: String) {
        self.id = id
        self.description = description
        self.lastPlayed = lastPlayed
        self.timesPlayed = timesPlayed
        self.title = title
    }
}


extension Game {
    static let sampleData = [
        Game(
            description: "BEES?",
            lastPlayed: Date(timeIntervalSinceNow: -60*60*24*10),
            timesPlayed: 10,
            title: "Apiary"
        ),
        Game(
            description: "Birds",
            lastPlayed: Date(timeIntervalSinceNow: -60*60*24*2),
            timesPlayed: 8,
            title: "Wingspan"
        ),
        Game(
            description: "Different Birds",
            lastPlayed: Date(timeIntervalSinceNow: -60*60*24*1),
            timesPlayed: 9,
            title: "Root"
        ),
        Game(
            description: "Mechs",
            lastPlayed: Date(timeIntervalSinceNow: -60*60*24*240),
            timesPlayed: 1,
            title: "Scyth"
        )
    ]
    
    static var emptyGame: Game {
        Game(
            description: "",
            lastPlayed: Date.now,
            timesPlayed: 0,
            title: ""
        )
   }
}
