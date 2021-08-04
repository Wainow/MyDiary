//
//  NoteObjectToNoteMapper.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation

class NoteObjectToNoteMapper{
    static func map(noteObject: NoteObject) -> Note{
        let note = Note(
            id: noteObject.id,
            title: noteObject.title,
            date: noteObject.date,
            evaluate: noteObject.evaluate,
            tags: [String](),
            isLocked: noteObject.isLocked,
            story: noteObject.story
        )
        for tag in noteObject.tags {
            note.tags.append(tag)
        }
        return note
    }
    
    static func map(noteObjects: [NoteObject]) -> [Note]{
        var notes = [Note]()
        for note in noteObjects {
            notes.append(
                map(noteObject: note)
            )
        }
        return notes
    }
}
