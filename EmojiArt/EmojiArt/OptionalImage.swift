//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Halis  Kara on 4.05.2021.
//

import SwiftUI



import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
