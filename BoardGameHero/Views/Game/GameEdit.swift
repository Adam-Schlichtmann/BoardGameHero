//
//  GameEdit.swift
//  BoardGames
//
//  Created by Adam Schlichtmann on 4/10/24.
//

import SwiftUI


struct GameEdit: View {
    @Binding var game: Game

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter
    }()
    
    var body: some View {
        Form {
           Section(header: Text("Game Info")) {
               TextField("Title", text: $game.title)
               TextField("Description", text: $game.description)
               DatePicker("Last Played", selection: $game.lastPlayed, displayedComponents: [.date])
           }
       }
    }
}


struct GameEdit_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GameEdit(game: .constant(Game.sampleData[0]))
        }
    }
}
