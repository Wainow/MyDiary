//
//  CellView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import SwiftUI

struct CellView: View {
    var note: Note
    var body: some View {
        VStack{
            TopView(title: note.title, date: note.date)
            Text(note.story)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(note: Note())
    }
}
