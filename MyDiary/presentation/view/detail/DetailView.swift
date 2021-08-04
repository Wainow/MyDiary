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
        VStack(alignment: .center, spacing: 100){
            VStack(alignment: .leading, spacing: 0){
                EvaluateView(
                    evaluate: note.evaluate,
                    isEditable: false
                ) { result in }
                .padding(5)
            }
            Text(note.story)
            Spacer()
        }
        .navigationTitle(note.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Text(note.date))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(story: "123123"))
    }
}
