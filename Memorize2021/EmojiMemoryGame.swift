//
//  EmojiMemoryGame.swift
//  Memorize2021
//
//  Created by Gabriel Miranda on 29/11/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    
    private static func createMemoryGame(emojis: Array<String>, numberOfPairs: Int) -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: numberOfPairs){ pairIndex in //Função enviada POR PARAMETRO para definir o valor do content do card
            emojis[pairIndex]
        }
    }
    
    private func createColor(color: String) -> Color {
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
    
    private static func createGameTheme() -> GameTheme{
        GameTheme()
    }
    
    private static var gameTheme = createGameTheme()
    @Published private var theme = gameTheme.theme
    @Published private var model = EmojiMemoryGame.createMemoryGame(emojis: EmojiMemoryGame.gameTheme.theme.emojis.shuffled(), numberOfPairs:  EmojiMemoryGame.gameTheme.theme.numberOfPairsOfCards)
        
    
    var cards: Array<Card>{
        return model.cards
    }
    
    var score: Int{
        return model.score
    }
    
    var themeColor: Color{
        return createColor(color: theme.color)
    }
    
    // MARK: - Intents
    
    func choose(_ card: Card){
        model.choose(card)
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func newGame(){
        theme = EmojiMemoryGame.createGameTheme().theme
        model = EmojiMemoryGame.createMemoryGame(emojis: theme.emojis.shuffled(), numberOfPairs: theme.numberOfPairsOfCards)
        print("Started new game")
    }
}
