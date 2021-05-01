//
//  EmojiMemoryGameView.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 16.03.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        Grid(viewModel.cards) { card in
            cardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
            }.padding(5)
        }
        
        .padding().foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
       
    }
    
}





struct cardView:View{
    var card : MemoryGame<String>.Card

    var body :some View{
        GeometryReader{ geometry in
            
        ZStack{
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeineWidth)
                Text(self.card.content)
            }else{
                if !card.isMatched{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))

                }

            }
           

        }
        .font(Font.system(size:min(geometry.size.width,geometry.size.height) * fontScaleFactor))
        }
    }
    
    
    
    // MARK: - Drawing Constants
    
    let cornerRadius : CGFloat = 10
    let edgeineWidth : CGFloat = 3
    let fontScaleFactor : CGFloat = 0.75
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
