//
//  NewNoteView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import SwiftUI

struct NewNoteView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: NoteViewModel
    @State var title: String = "New Day"
    @State var story: String = ""
    @State var evaluate: Int = 0
    @State var tags = [String]()
    
    init(model: NoteViewModel) {
        viewModel = model
        _title = State(wrappedValue: viewModel.todayNote.title)
        _story = State(wrappedValue: viewModel.todayNote.story)
        _evaluate = State(wrappedValue: viewModel.todayNote.evaluate)
        _tags = State(wrappedValue: viewModel.todayNote.tags)
    }
    
    var body: some View {
        EvaluateView(
            evaluate: viewModel.todayNote.evaluate,
            isEditable: true 
        ) { result in
            evaluate = result
        }
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("Title:")
                        .font(.callout)
                        .bold()
                MultilineTextField(
                    "Enter title of day",
                    text:self.$title
                ).overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray))
            }
            VStack(alignment: .leading){
                Text("Description:")
                        .font(.callout)
                        .bold()
                MultilineTextField(
                    "Enter description of day",
                    text:self.$story
                ).overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray))
            }
            VStack(alignment: .leading){
                Button(action: {
                    MyAlert().getTagAlert { result in
                        if(!result.isEmpty
                            && !result.deleteAllSpacers().isEmpty
                        ){
                            tags.append(result.deleteIncorrectSpacers())
                        }
                    }
                }) { Text("Add tag") }
                TagListView(tags: $tags, deleteTagAction: { index in
                    print("index: \(index) tag: \(tags[index])")
                    tags.remove(at: index)
                    print("tags: \(tags)")
                })
                Spacer()
            }
        }.padding()
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button("Save", action: {
            viewModel.todayNote.title = title
            viewModel.todayNote.story = story
            viewModel.todayNote.evaluate = evaluate
            viewModel.todayNote.tags = tags
            viewModel.saveNote(note: viewModel.todayNote)
            self.presentationMode.wrappedValue.dismiss()
        }), trailing: Text(viewModel.todayNote.date))
    }
}

struct NewNoteView_Previews: PreviewProvider {
    @State static var viewModel = NoteViewModel(
        noteInteractor: NoteInteractorImpl(
            noteRepository: NoteRepositoryImpl()
        )
    )
    static var previews: some View {
        NewNoteView(model: viewModel)
    }
}
