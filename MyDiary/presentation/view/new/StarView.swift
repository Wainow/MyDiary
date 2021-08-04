//
//  StarView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 20.07.2021.
//

import SwiftUI

struct StarView: View {
    var viewModel: StarViewModel
    var evaluate: Int
    var isEditable: Bool
    var sendResult: (Int) -> Void
    
    var body: some View {
        Button(action: {
            if(isEditable){
                viewModel.updateData(evaluate: evaluate)
                sendResult(evaluate)
            }
        }){
            Image(viewModel.starImages[evaluate-1])
                .resizable()
                .scaledToFit()
                .frame(width: 25.0, height: 25.0)
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(
            viewModel: StarViewModel(
                evaluate: 3,
                interactor: NoteInteractorImpl(
                    noteRepository: NoteRepositoryImpl()
                )
            ),
            evaluate: 3,
            isEditable: true,
            sendResult: { result in }
        )
    }
}
