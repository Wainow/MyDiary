//
//  NoteToNoteObjectMapper.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation
import RealmSwift

class NoteToNoteObjectMapper{
    static func map(note: Note) -> NoteObject{
        let noteObject = NoteObject()
        noteObject.id = note.id
        noteObject.date = note.date
        noteObject.title = note.title
        noteObject.story = note.story
        noteObject.evaluate = note.evaluate
        noteObject.isLocked = note.isLocked
        noteObject.tags = List<String>()
        for tag in note.tags {
            noteObject.tags.append(tag)
        }
        return noteObject
    }
    
    static func map(notes: [Note]) -> [NoteObject] {
        var noteObjects = [NoteObject]()
        for note in notes {
            noteObjects.append(
                map(note: note)
            )
        }
        return noteObjects
    }
}
