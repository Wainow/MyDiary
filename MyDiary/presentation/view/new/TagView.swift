//
//  TagView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 28.07.2021.
//

import SwiftUI

struct TagView: View {
    var tag: String
    var index: Int
    var deleteTagAction: (Int) -> Void
    var body: some View {
        HStack(alignment: .center){
            Text(tag)
                .font(.headline)
                .foregroundColor(.white)
            Button(action: { deleteTagAction(index) }, label: {
                Image("white_cross")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10.0, height: 10.0)
            })
        }
        .padding()
        .background(Color(.systemTeal))
        .cornerRadius(10)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: "tag", index: 0, deleteTagAction: { index in })
    }
}
