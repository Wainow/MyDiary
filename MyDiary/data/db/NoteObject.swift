//
//  NoteObject.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation
import RealmSwift

class NoteObject: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = "New Day"
    @objc dynamic var date = CurrentDateHelper.getCurrentDate()
    @objc dynamic var evaluate = 0
    var tags = List<String>()
    @objc dynamic var isLocked = false
    @objc dynamic var story = ""
    
}
