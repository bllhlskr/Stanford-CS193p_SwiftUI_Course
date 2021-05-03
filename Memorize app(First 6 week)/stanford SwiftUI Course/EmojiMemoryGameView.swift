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
        VStack{
        Grid(viewModel.cards) { card in
            cardView(card: card).onTapGesture {
                withAnimation(.linear){
                    viewModel.choose(card: card)
                }
            }.padding(5)
        }
        
        .padding().foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
            Button(action: {
                withAnimation(.easeInOut){
                    self.viewModel.resetGame()
                }
               
            }, label: {
                Text("New Game")
            })
        }
    }
    
}





struct cardView:View{
    var card : MemoryGame<String>.Card

    var body :some View{
        GeometryReader{ geometry in
            if card.isFaceUp || !card.isMatched{
                
        ZStack{
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90),clockWise: true).padding(5).opacity(0.4)
            Text(self.card.content)
                .font(Font.system(size:min(geometry.size.width,geometry.size.height) * fontScaleFactor))
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
        }
        .cardify(isFaceUp : card.isFaceUp)
        .transition(AnyTransition.scale)
        
            
     
           

        }
        }
        
    }
    
    
    
    // MARK: - Drawing Constants
    
    private let cornerRadius : CGFloat = 10
    private let edgeineWidth : CGFloat = 3
    private let fontScaleFactor : CGFloat = 0.75
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
