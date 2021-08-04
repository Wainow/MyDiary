//
//  NoteViewModel.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Combine

class NoteViewModel: ObservableObject {
    @Published var notes = [Note]()
    @Published var todayNote = Note()
    var interactor: NoteInteractor
    
    init(noteInteractor: NoteInteractor) {
        interactor = noteInteractor
        notes = interactor.getNotes()
        todayNote = interactor.getTodayNote(notes: notes)
    }
    
    func saveNote(note: Note){
        if(interactor.saveNote(note: note)){
            updateNotes()
        }
    }
    
    func updateNotes() {
        notes = interactor.getNotes()
        todayNote = interactor.getTodayNote(notes: notes)
    }
    
    func deleteNotes(){
        if(interactor.deleteNotes()){
            updateNotes()
        }
    }
}
