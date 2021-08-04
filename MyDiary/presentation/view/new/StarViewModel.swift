//
//  StarViewModel.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 18.07.2021.
//

import Foundation

class StarViewModel: ObservableObject {
    var interactor: NoteInteractor
    @Published var evaluate: Int
    @Published var starImages = [
        "empty-star",
        "empty-star",
        "empty-star",
        "empty-star",
        "empty-star"
    ]
    init(evaluate: Int, interactor: NoteInteractor) {
        self.evaluate = evaluate
        self.interactor = interactor
        updateData(evaluate: evaluate)
    }
    
    func updateData(evaluate: Int){
        if(evaluate > 0 && evaluate < 5){
            for i in 1...evaluate {
                starImages[i-1] = "star"
            }
            for i in evaluate+1...5 {
                starImages[i-1] = "empty-star"
            }
        } else if(evaluate == 5){
            starImages = [
                "star",
                "star",
                "star",
                "star",
                "star"
            ]
        } else if(evaluate == 0){
            starImages = [
                "empty-star",
                "empty-star",
                "empty-star",
                "empty-star",
                "empty-star"
            ]
        }
    }
}
