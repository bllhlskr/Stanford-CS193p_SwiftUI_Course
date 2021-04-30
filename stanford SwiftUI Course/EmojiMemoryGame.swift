//
//  EmojiMemoryGame.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 17.03.2021.
//

import SwiftUI


class EmojiMemoryGame{
    
    private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() ->MemoryGame<String>{
        let emojis : Array<String> = ["👻","🎃","🕷"]
       return MemoryGame<String>(numberOfPairsOfCards : 2) { pairIndex in
        return emojis[pairIndex]
        }
    }
    
    // MARK: -ACCESS to the Model
    var cards:Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    
    //MARK: -INTENT(s)
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    
    
    struct CustomType : Identifiable{
        var id = UUID()
        let title : String
    }

    struct ContentView: View {
        
        let iterableObject = [
            CustomType( title: "title1"),
            CustomType( title: "title2"),
            CustomType( title: "title3")
        ]

        var body: some View {
            VStack {
                ForEach(iterableObject) { object in
                    Text("ObjectTitle: \(object.title)")
                }
            }
        }
    }
}


