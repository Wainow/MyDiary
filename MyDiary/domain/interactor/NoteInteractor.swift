//
//  NoteInteractor.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation

protocol NoteInteractor {
    func getNotes() -> [Note]
    func saveNote(note: Note) -> Bool
    func deleteNotes() -> Bool
    func getTodayNote(notes: [Note]?) -> Note
    func saveTodayNote(
        title: String?,
        story: String?,
        evaluate: Int?,
        color: String?,
        tags: [String]?,
        isLocked: Bool?
    ) -> Bool
}

class NoteInteractorImpl: NoteInteractor {
    init(noteRepository: NoteRepository) {
        repository = noteRepository
    }
    var repository: NoteRepository
    
    func getNotes() -> [Note] { repository.getNotes() }
    func saveNote(note: Note) -> Bool { repository.saveNote(note: note) }
    func deleteNotes() -> Bool { repository.deleteNotes() }
    func getTodayNote(notes: [Note]? = nil) -> Note {
        let nonOptionalNotes = notes ?? getNotes()
        if(!nonOptionalNotes.isEmpty && nonOptionalNotes.last?.id == CurrentDateHelper.getIdFromCurrentDate()){
            return (nonOptionalNotes.last)!
        } else{
            return Note()
        }
    }
    func saveTodayNote(
        title: String? = nil,
        story: String? = nil,
        evaluate: Int? = nil,
        color: String? = nil,
        tags: [String]? = nil,
        isLocked: Bool? = nil
    ) -> Bool {
        let todayNote = getTodayNote()
        
        todayNote.title = title ?? todayNote.title
        todayNote.story = story ?? todayNote.story
        todayNote.evaluate = evaluate ?? todayNote.evaluate
        todayNote.tags = tags ?? todayNote.tags
        todayNote.isLocked = isLocked ?? todayNote.isLocked
        
        return saveNote(note: todayNote)
    }
}
