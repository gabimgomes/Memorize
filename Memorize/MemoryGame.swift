//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Gabriela Martins Gomes on 16/01/25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max (2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id:"\(pairIndex+1)a"))
            cards.append(Card(content: content, id:"\(pairIndex+1)b"))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
        var id: String
    }
}
