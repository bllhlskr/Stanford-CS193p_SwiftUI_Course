
//
//  MemoryGame.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 17.03.2021.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards:Array<Card>
    
    
    func choose(card: Card){
        print("Choosen card:  \(card)")
    }
    
    init(numberOfPairsOfCards:Int, cardContentFactory:(Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content, id: pairIndex*2))
            cards.append(Card( content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card:Identifiable{
        var isFaceUp : Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id : Int
        
    }
}
