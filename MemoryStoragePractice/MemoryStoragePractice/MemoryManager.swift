//
//  MemoryManager.swift
//  MemoryStoragePractice
//
//  Created by Арсентий Халимовский on 29.04.2023.
//

import Foundation

final class MemoryManager {
    
    static var shared = MemoryManager()
    
    static var memoryStorage = UserDefaults.standard
    
    var storage = [UserData]()
    
    
}
