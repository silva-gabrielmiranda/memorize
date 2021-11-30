//
//  EmojiMemoryGame.swift
//  Memorize2021
//
//  Created by Gabriel Miranda on 29/11/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    static var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🏍","🛺","🚔","🚍","🚘","🚖","🚡","🚠"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: Int.random(in: emojis.indices)){ pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
