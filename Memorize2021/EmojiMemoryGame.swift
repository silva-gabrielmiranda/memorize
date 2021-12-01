//
//  EmojiMemoryGame.swift
//  Memorize2021
//
//  Created by Gabriel Miranda on 29/11/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    static var theme: GameTheme = GameTheme()
    
    static func createMemoryGame(emojis: Array<String>) -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 5){ pairIndex in //Função enviada POR PARAMETRO para definir o valor do content do card
            emojis[pairIndex]
        }
    }
    
    static func createColor() -> Color {
        switch theme.choosedTheme.color{
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
    
    @Published private var model: MemoryGame<String> = createMemoryGame(emojis: EmojiMemoryGame.theme.choosedTheme.emojis)
    @Published var themeColor: Color = createColor()
    
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        EmojiMemoryGame.theme.createNewTheme()
        themeColor = EmojiMemoryGame.createColor()
        model = EmojiMemoryGame.createMemoryGame(emojis: EmojiMemoryGame.theme.choosedTheme.emojis)
        print("Started new game")
    }
}
