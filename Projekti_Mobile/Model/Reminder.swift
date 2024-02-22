//
//  Reminder.swift
//  Projekti_Mobile
//
//  Created by user253361 on 2/22/24.
//

import Foundation
import SwiftData

@Model
final class Reminder{
    var name: String
    var isCompleted=false
    
    init(name: String, isCompleted: Bool = false){
        self.name=name
        self.isCompleted=isCompleted
    }
}
