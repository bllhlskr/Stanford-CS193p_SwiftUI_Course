//
//  PaletteChooser.swift
//  EmojiArt
//
//  Created by Halis  Kara on 6.05.2021.
//

import SwiftUI

struct PaletteChooser: View {
    @Binding  var chosenPalette: String
    @State private var showPaletteEditor = false
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
            
            Image(systemName: "keyboard").imageScale(.large).onTapGesture {
                self.showPaletteEditor = true
            }.popover(isPresented:$showPaletteEditor) {
                PaletteEditor(chosenPalette: $chosenPalette).environmentObject(self.document)
                    .frame(minWidth:300,minHeight: 500)
            }
        }.fixedSize(horizontal:true,vertical:false)
        .onAppear{
            self.chosenPalette = self.document.defaultPalette
        }
    }
}

struct PaletteEditor : View{
    @EnvironmentObject var document: EmojiArtDocument
    @Binding var chosenPalette : String
    @State private var paletteName: String = ""
    @State private var emojisToAdd : String = ""
    var body : some View{
        VStack(spacing:0){
            Text("Palette Editor").font(.headline).padding()
            Divider()
            Form{
                Section(header: Text("Palette Name ")){
                    TextField("Palette Name ", text:$paletteName, onEditingChanged:{ began in
                        if !began{
                            self.document.renamePalette(self.chosenPalette, to: self.paletteName)
                        }
                        
                    }).padding()
                }
                Section{
                    TextField("Add Emoji ", text:$emojisToAdd, onEditingChanged:{ began in
                        if !began{
                            self.chosenPalette = self.document.addEmoji(self.emojisToAdd,toPalette:self.chosenPalette)
                        }
                        
                    }).padding()
                }
                Section(header: Text("Remove Emoji")){
                    Grid(chosenPalette.map{String($0)},id: \.self){emoji in
                        Text(emoji).font(Font.system(size:self.fontSize))
                            .onTapGesture{
                            self.chosenPalette = self.document.removeEmoji(emoji, fromPalette: self.chosenPalette)
                        }
                    }.frame(height: self.height)
                }
            }
            Spacer()
        }
        .onAppear{
            self.paletteName = self.document.paletteNames[self.chosenPalette] ?? ""
        }
       
    }
    var height : CGFloat {
        CGFloat((chosenPalette.count - 1) / 6) * 70 + 70
    }
    let fontSize : CGFloat = 40
}
