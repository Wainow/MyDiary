//
//  NoteRepositoryImpl.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation

class NoteRepositoryImpl: NoteRepository {
    func getNotes() -> [Note] { DBHelper.getRealmData() }
    func deleteNotes() -> Bool { DBHelper.deleteRealmData() }
    func saveNote(note: Note) -> Bool { DBHelper.saveRealmData(note: note) }
}
