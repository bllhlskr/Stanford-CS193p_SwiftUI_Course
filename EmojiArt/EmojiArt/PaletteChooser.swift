//
//  PaletteChooser.swift
//  EmojiArt
//
//  Created by Halis  Kara on 6.05.2021.
//

import SwiftUI

struct PaletteChooser: View {
    @Binding  var chosenPalette: String 
    @ObservedObject var document : EmojiArtDocument
    var body: some View {
        HStack{
            Stepper {
                self.chosenPalette = self.document.palette(after:self.chosenPalette)
            } onDecrement: {
                self.chosenPalette = self.document.palette(before:self.chosenPalette)
            } label: {
               EmptyView()
            }
            Text(self.document.paletteNames[self.chosenPalette] ?? "")
        }.fixedSize(horizontal:true,vertical:false)
        .onAppear{
            self.chosenPalette = self.document.defaultPalette
        }
    }
}

