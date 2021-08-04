//
//  TopView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import SwiftUI

struct TopView: View {
    let title: String
    let date: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
            Spacer()
            Text(date)
        }.padding()
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(title: "Oh my god", date: "12.12.2000")
    }
}
