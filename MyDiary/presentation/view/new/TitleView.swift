//
//  TitleView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 18.07.2021.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Title:")
                .font(.callout)
                .bold()
        MultilineTextField(
            "Enter title of day",
            text:self.$title
        ).overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray))
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
