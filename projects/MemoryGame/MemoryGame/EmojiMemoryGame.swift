//
//  EmojiMemoryGame.swift
//  MemoryGame
//
// This is the ViewModel to the Views that we would be creating in this app. The ViewModel never talks to the Views, only the Views will talk to the ViewModel, and this is why the ViewModel is a class not a struct.
//
// This has to do with memory allocation to the heap. (refer to the notes for more information)
//
//  Created by Tan Ren Jie on 8/8/20.
//  Copyright © 2020 Tan Ren Jie. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count){ pairIndex in return emojis[pairIndex]
        }
    }
    
    
//    Marks: - Access to Model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
//    MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
