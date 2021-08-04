//
//  NoteRepository.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation

protocol NoteRepository {
    func getNotes() -> [Note]
    func saveNote(note: Note) -> Bool
    func deleteNotes() -> Bool
}
