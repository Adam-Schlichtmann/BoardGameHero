//
//  GameDetail.swift
//  BoardGames
//
//  Created by Adam Schlichtmann on 4/10/24.
//

import SwiftUI


struct GameDetail: View {
    @Binding var game: Game
    
    @State private var editingGame = Game.emptyGame
    @State private var isEditing = false


    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("About")) {
                    HStack {
                        Label("Title", systemImage: "rosette")
                        Spacer()
                        Text(game.title)
                    }
                    HStack {
                        Label("Description", systemImage: "ellipsis")
                        Spacer()
                        Text(game.description)
                    }
                    HStack {
                        Label("Times Played", systemImage: "play")
                        Spacer()
                        Text("\(game.timesPlayed)")
                    }
                    HStack {
                        Label("Last Played", systemImage: "clock")
                        Spacer()
                        Text("\(game.lastPlayed.formatted())")
                    }
                }
            }
            .toolbar {
                Button(action: {
                    isEditing = true
                    editingGame = game
                }) {
                    Text("Edit")
                    Image(systemName: "pencil")
                }
                .accessibilityLabel("Edit Game")
                .sheet(isPresented: $isEditing) {
                    NavigationStack {
                        GameEdit(game: $editingGame).navigationTitle(game.title)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        isEditing = false
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        isEditing = false
                                        game = editingGame
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
}


struct GameDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GameDetail(game: .constant(Game.sampleData[0]))
        }
    }
}
