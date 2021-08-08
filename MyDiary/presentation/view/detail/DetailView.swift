//
//  DetailView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            VStack(alignment: .leading, spacing: 0){
                EvaluateView(
                    evaluate: note.evaluate,
                    isEditable: false,
                    size: 25.0
                ) { result in }
            }
            Spacer(minLength: .some(30))
            ScrollView{
                Text(note.story)
            }
            Spacer()
        }
        .navigationTitle(note.title)
        .navigationBarItems(trailing: Text(note.date))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(story: "123123"))
    }
}
