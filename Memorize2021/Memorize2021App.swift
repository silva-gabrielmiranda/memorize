//
//  Memorize2021App.swift
//  Memorize2021
//
//  Created by Gabriel Miranda on 28/11/21.
//

import SwiftUI

@main
struct Memorize2021App: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
