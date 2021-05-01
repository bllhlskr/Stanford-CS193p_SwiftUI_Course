
//
//  MemoryGame.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 17.03.2021.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards:Array<Card>
    
    
    mutating func choose(card: Card){
        print("Choosen card:  \(card)")
        let chosenIndex : Int = self.index(of:card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        
    }
    
    func index(of card:Card)->Int{
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id{
                return index
            }
        }
        return -1 // TODO bogus
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
