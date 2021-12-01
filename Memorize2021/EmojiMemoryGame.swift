//
//  EmojiMemoryGame.swift
//  Memorize2021
//
//  Created by Gabriel Miranda on 29/11/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    
    static func createMemoryGame(emojis: Array<String>, numberOfPairs: Int) -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: numberOfPairs){ pairIndex in //Função enviada POR PARAMETRO para definir o valor do content do card
            emojis[pairIndex]
        }
    }
    
    func createColor(color: String) -> Color {
        switch color{
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        case "green":
            return Color.green
        default:
            return Color.black
        }
    }
    
    static func createGameTheme() -> GameTheme{
        GameTheme()
    }
    
    static var gameTheme: GameTheme = createGameTheme()
    @Published private var theme = gameTheme.theme
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(emojis: EmojiMemoryGame.gameTheme.theme.emojis.shuffled(), numberOfPairs:  EmojiMemoryGame.gameTheme.theme.numberOfPairsOfCards)
        
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    var score: Int{
        return model.score
    }
    
    var themeColor: Color{
        return createColor(color: theme.color)
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        theme = EmojiMemoryGame.createGameTheme().theme
        model = EmojiMemoryGame.createMemoryGame(emojis: theme.emojis.shuffled(), numberOfPairs: theme.numberOfPairsOfCards)
        print("Started new game")
    }
}
