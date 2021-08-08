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
    let evaluate: Int
    var body: some View {
        HStack {
            Text(title)
                .font(.body)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .lineLimit(3)
            Spacer()
            VStack{
                Text(date)
                EvaluateView(
                    evaluate: evaluate,
                    isEditable: false,
                    size: 15.0,
                    sendResponse: { result in }
                )
            }
        }.padding()
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(title: "Oh my god", date: "12.12.2000", evaluate: 3)
    }
}
