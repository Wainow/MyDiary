//
//  ContentView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    var body: some View {
        TabView {
            CellListView().tabItem {
                Image(systemName: "doc.plaintext")
                Text("Home")
            }
            Text("Home Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "search")
                    Text("Home")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
