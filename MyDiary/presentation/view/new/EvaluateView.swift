//
//  StarView.swift
//  MyDiary
//
//  Created by Алексей Черепанов on 18.07.2021.
//

import SwiftUI

struct EvaluateView: View {
    @ObservedObject var viewModel: StarViewModel
    @State var evaluate = 0
    var isEditable: Bool
    var sendResponse: (Int) -> Void
    
    init(evaluate: Int,
         isEditable: Bool,
         sendResponse: @escaping (Int) -> Void
    ){
        _evaluate = State(wrappedValue: evaluate)
        viewModel = StarViewModel(
            evaluate: evaluate,
            interactor: NoteInteractorImpl(
                noteRepository: NoteRepositoryImpl()
            )
        )
        self.isEditable = isEditable
        self.sendResponse = sendResponse
    }
    
    var body: some View {
        HStack(alignment: .bottom){
            StarView(
                viewModel: viewModel,
                evaluate: 1,
                isEditable: isEditable
            ) { result in
                sendResponse(result)
            }
            StarView(
                viewModel: viewModel,
                evaluate: 2,
                isEditable: isEditable
            ) { result in
                sendResponse(result)
            }
            StarView(
                viewModel: viewModel,
                evaluate: 3,
                isEditable: isEditable
            ) { result in
                sendResponse(result)
            }
            StarView(
                viewModel: viewModel,
                evaluate: 4,
                isEditable: isEditable
            ) { result in
                sendResponse(result)
            }
            StarView(
                viewModel: viewModel,
                evaluate: 5,
                isEditable: isEditable
            ) { result in
                sendResponse(result)
            }
            
        }
    }
}

struct EvaluateView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluateView(
            evaluate: 3,
            isEditable: true,
            sendResponse: { result in }
        )
    }
}
