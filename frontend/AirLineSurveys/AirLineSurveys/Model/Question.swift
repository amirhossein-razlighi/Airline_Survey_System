//
//  Question.swift
//  AirLineSurveys
//
//  Created by Amirhossein Razlighi on 29/01/2023.
//

import Foundation

class Question: ObservableObject {
    @Published var id: Int
    @Published var questionNumber: Int
    @Published var questionText: String 
    
    init(id: Int, questionNumber: Int, questionText: String) {
        self.id = id
        self.questionNumber = questionNumber
        self.questionText = questionText
    }
}
