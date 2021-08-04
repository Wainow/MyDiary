//
//  TagListView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 28.07.2021.
//

import SwiftUI

var columns = [
  GridItem(.flexible()),
  GridItem(.flexible()),
  GridItem(.flexible())
]

struct TagListView: View {
    @Binding var tags: [String]
    var deleteTagAction: (Int) -> Void
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20, pinnedViews: .sectionHeaders) {
                ForEach(0..<tags.count, id: \.self) { i in
                    TagView(tag: tags[i], index: i, deleteTagAction: { index in
                        tags.remove(at: index)
                        print("index: \(index) tags: \(tags[index])")
                    })
                }
            }
            List(tags, id: \.self){ tag in
                Text(tag)
            }
        }
    }
}
    

struct TagListView_Previews: PreviewProvider {
    @State static var tags: [String] = ["tag", "tag"]
    static var previews: some View {
        TagListView(tags: $tags, deleteTagAction: { index in })
    }
}
