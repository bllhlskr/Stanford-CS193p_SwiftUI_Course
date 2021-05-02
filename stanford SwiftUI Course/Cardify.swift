//
//  Cardify.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 2.05.2021.
//

import SwiftUI

struct Cardify: ViewModifier{
    var isFaceUp: Bool
    func body(content: Content)-> some View{
        ZStack{
            if self.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeineWidth)
                content
                
            }else{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                
            }
        }
    }
    
    
    private let cornerRadius : CGFloat = 10
    private let edgeineWidth : CGFloat = 3
    
}

extension View {
    func cardify(isFaceUp: Bool) ->some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
    
}














