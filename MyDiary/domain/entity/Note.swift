//
//  Note.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation

class Note: Identifiable{
    init(
        id: Int = CurrentDateHelper.getIdFromCurrentDate(),
        title: String = "New Day",
        date: String = CurrentDateHelper.getCurrentDate(),
        evaluate: Int = 0,
        tags: [String] = [],
        isLocked: Bool = false,
        story: String = ""
        
    ) {
        self.id = id
        self.date = date
        self.title = title
        self.evaluate = evaluate
        self.tags = tags
        self.isLocked = isLocked
        self.story = story
    }
    var id: Int
    var title: String
    var date: String
    var evaluate: Int
    var tags: [String]
    var isLocked: Bool
    var story: String
}

extension String {
    func deleteIncorrectSpacers() -> String {
        self.replacingOccurrences(
            of: "\\s*(\\p{Po}\\s?)\\s*",
            with: "$1",
            options: [.regularExpression])
    }
    func deleteAllSpacers() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
