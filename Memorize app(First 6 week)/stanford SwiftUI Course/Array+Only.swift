//
//  Array+Only.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 2.05.2021.
//

import Foundation


extension Array {
    var only : Element?{
        count == 1 ? first : nil
    }
}
