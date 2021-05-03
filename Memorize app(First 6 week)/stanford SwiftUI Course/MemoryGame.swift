
//
//  MemoryGame.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 17.03.2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable{
    private(set) var cards:Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{
            cards.indices.filter { cards[$0].isFaceUp}.only
        
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
                
            }
        }
    }
    
    mutating func choose(card: Card){
        if let chosenIndex : Int = cards.firstIndex(matching: card) , !cards[chosenIndex].isFaceUp{
            if let potentialMatchIndex =  indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true

            }else{
               
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
  
    
    
    init(numberOfPairsOfCards:Int, cardContentFactory:(Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content, id: pairIndex*2))
            cards.append(Card( content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card:Identifiable{
        var isFaceUp : Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id : Int
        
    }
}
