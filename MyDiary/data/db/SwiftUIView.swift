//
//  SwiftUIView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 03.08.2021.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("ПРИВЕТ ТЫ НЕ ЗНАЕШЬ ГДЕ ПЕЧЕНЬЕ??")
                Spacer()
                Text("я тоже не знаю....")
                Spacer()
                Text("ДАВАЙ СПРОСИМ У СОТРУДНИКОВ?")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
