//
//  CurrentDateHelper.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 04.07.2021.
//

import Foundation

class CurrentDateHelper{
    static func getCurrentDate(
        formatterString: String = "dd.MM.yyyy"
    ) -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = formatterString
        return formatter.string(from: date)
    }
    
    static func getIdFromCurrentDate() -> Int {
        let year = getCurrentDate(formatterString: "yyyy")
        let month = getCurrentDate(formatterString: "MM")
        let day = getCurrentDate(formatterString: "dd")
        return Int("\(year)\(month)\(day)") ?? 0
    }
}
