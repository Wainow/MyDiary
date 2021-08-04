//
//  DBHelper.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation
import RealmSwift

class DBHelper {
    static func getRealmData() -> [Note]{
        return NoteObjectToNoteMapper.map(
            noteObjects: Array(
                try! Realm().objects(NoteObject.self)
            )
        )
    }
    
    static func saveRealmData(note: Note) -> Bool{
        let realm = try! Realm()
        let todayNote = realm
            .objects(NoteObject.self)
            .filter("id == \(note.id)")
            .first
        if(todayNote != nil){
            try! realm.write{
                todayNote!.title = note.title
                todayNote!.story = note.story
                todayNote!.evaluate = note.evaluate
                todayNote!.tags.removeAll()
                print("SAVE: \(note.tags)")
                for tag in note.tags {
                    todayNote!.tags.append(tag)
                }
                print("SAVE: \(todayNote!.tags)")
                todayNote!.isLocked = note.isLocked
            }
        } else {
            try! realm.write{
                realm.add(NoteToNoteObjectMapper.map(note: note))
            }
        }
        return true

    }
    
    static func deleteRealmData() -> Bool{
        let realm = try! Realm()
        try! realm.write{
            realm.delete(
                realm
                    .objects(NoteObject.self)
            )
        }
        return true
    }
}
