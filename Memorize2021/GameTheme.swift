//
//  GameTheme.swift
//  Memorize2021
//
//  Created by Gabriel Miranda on 30/11/21.
//

import Foundation

struct GameTheme {
    var listOfThemes: Array<Theme> = [
        Theme(name : "Vehicles", color: "red", emojis: [ "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"], numberOfPairsOfCards: 10, id: 0),
        Theme(name : "Constructions", color: "blue", emojis: [ "🏰", "🏯", "🗼", "🏟", "🎡", "🎢", "🎠", "⛲️", "🏭", "🏢", "🏬", "🏣", "🏨" ], numberOfPairsOfCards: 10, id: 1),
        Theme(name : "Smiles", color: "green", emojis: [ "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂"], numberOfPairsOfCards: 10, id: 2)
    ]
    var choosedTheme: Theme
    
    init(){
        choosedTheme = listOfThemes[Int.random(in: listOfThemes.indices)]
        print("Theme: \(choosedTheme.name)")
    }
    
    mutating func createNewTheme(){
        choosedTheme = listOfThemes[Int.random(in: listOfThemes.indices)]
    }
    
    struct Theme: Identifiable{
        var name: String
        var color: String
        var emojis: Array<String>
        var numberOfPairsOfCards: Int
        var id: Int
    }
}
