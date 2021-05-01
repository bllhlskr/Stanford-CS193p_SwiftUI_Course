//
//  Array+Identifiable.swift
//  stanford SwiftUI Course
//
//  Created by Halis  Kara on 2.05.2021.
//

import Foundation




extension Array where Element : Identifiable{
    
    func firstIndex(matching: Element) -> Int?{
        for index in 0..<self.count {
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
    
}
