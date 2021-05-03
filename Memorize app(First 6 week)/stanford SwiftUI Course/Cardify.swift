//
//  Cardify.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 2.05.2021.
//

import SwiftUI

struct Cardify: AnimatableModifier{
    var rotation : Double
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0 :180
    }
    
    var isFaceUp: Bool{
        rotation < 90
    }
    
    var animatableData : Double {
        get {return rotation }
        set{rotation = newValue}
    }
    
    func body(content: Content)-> some View{
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeineWidth)
                content
                
                
            }.opacity(isFaceUp ? 1 :0)
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                .opacity(isFaceUp ? 0 :1
                )
        }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (x: 0.0, y: 1.0, z: 0.0)
            
            )
    }
    
    
    private let cornerRadius : CGFloat = 10
    private let edgeineWidth : CGFloat = 3
    
}

extension View {
    func cardify(isFaceUp: Bool) ->some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
    
}














