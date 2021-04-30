//
//  ContentView.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 16.03.2021.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        
        HStack(spacing:12){
            ForEach(viewModel.cards){ card in
                cardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
        }
        }
        .padding().foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
       
    }
    
}





struct cardView:View{
    var card : MemoryGame<String>.Card

    var body :some View{
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content).font(Font.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 10).fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))

            }
           

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
