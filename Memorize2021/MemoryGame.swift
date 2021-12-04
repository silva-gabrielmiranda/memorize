//
//  MemoryGame.swift
//  Memorize2021
//
//  Created by Gabriel Miranda on 29/11/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    
    var cards: Array<Card>
    var score = 0
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue)}}
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    //Penalidade
                    if cards[chosenIndex].previouslySeen{
                        score -= 1
                    }
                    if cards[potentialMatchIndex].previouslySeen{
                        score -= 1
                    }
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp && !cards[index].isMatched{
                        cards[index].previouslySeen = true
                    }
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable{
        var isFaceUp = true
        var isMatched = false
        var previouslySeen = false
        var content: CardContent
        var id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
