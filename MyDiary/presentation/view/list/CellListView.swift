//
//  CellListView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 08.08.2021.
//

import SwiftUI

struct CellListView: View {
    @ObservedObject var viewModel = NoteViewModel(
        noteInteractor: NoteInteractorImpl(
            noteRepository: NoteRepositoryImpl()
        )
    )
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView{
            List(viewModel.notes.reversed()){ note in
                NavigationLink(destination: DetailView(note: note)){
                    CellView(note: note)
                }
            }
            .navigationBarTitle("My Diary")
            .navigationBarItems(
                leading:
                    Button("Delete all", action: {
                        MyAlert().getDeleteAlert { result in
                            if(result) { viewModel.deleteNotes() }
                        }
                    }),
                trailing:
                        NavigationLink(
                            destination: NewNoteView(model: viewModel),
                            isActive: $isLinkActive
                        ) {
                            Button(action: {
                                isLinkActive = true
                            }) {
                                Text("Today")
                            }
                        }
            )
        }
    }
}

struct CellListView_Previews: PreviewProvider {
    static var previews: some View {
        CellListView()
    }
}
