//
//  GameView.swift
//  BoardGames
//
//  Created by Adam Schlichtmann on 4/10/24.
//

import SwiftUI

struct GameView: View {
    let game: Game
    private var timeSinceLastPlay: String {
        return game.lastPlayed.timeAgoDisplay()
    }
    var body: some View {
        VStack {
            Text(game.title).font(.headline)
            Spacer()
            Text(game.description).font(.body)
            Spacer()
            HStack {
                Label("\(timeSinceLastPlay)", systemImage: "clock")
                Spacer()
                Label("\(game.timesPlayed)", systemImage: "play").labelStyle(.trailingIcon)
            }
            
        }
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var game = Game.sampleData[0]
    static var previews: some View {
        GameView(game: game)
    }
}
