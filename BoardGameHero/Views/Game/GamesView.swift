//
//  GamesView.swift
//  BoardGames
//
//  Created by Adam Schlichtmann on 4/10/24.
//

import SwiftUI


struct GamesView: View {
    @Binding var games: [Game]
    
    @State private var isAddingNew = false
    @State private var newGame: Game = Game.emptyGame
    
    var body: some View {
        NavigationStack {
            List($games, id: \.title) { $game in
                NavigationLink(destination: GameDetail(game: $game)) {
                    GameView(game: game)
                }
            }
            .navigationTitle("Games")
            .toolbar {
                Button(action: {
                    isAddingNew = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Game")
                .sheet(isPresented: $isAddingNew) {
                    NavigationStack {
                        GameEdit(game: $newGame).navigationTitle("New Game")
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        isAddingNew = false
                                        newGame = Game.emptyGame
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        isAddingNew = false
                                        games.append(newGame)
                                        newGame = Game.emptyGame
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
}

struct GamesViewPreview: PreviewProvider {
    static var previews: some View {
        GamesView(games: .constant(Game.sampleData))
    }
}
