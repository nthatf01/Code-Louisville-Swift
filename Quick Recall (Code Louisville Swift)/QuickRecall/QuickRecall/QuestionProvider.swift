//
//  QuestionProvider.swift
//  QuickRecall
//
//  Created by Nathaniel Hatfield on 5/29/17.
//  Copyright © 2017 Nathaniel Hatfield. All rights reserved.
//

import Foundation
import GameKit

class Question {
    let clue: String
    var answers: [String] = []
    
    init(_ clue: String, _ answers: [String]) {
        self.clue = clue
        self.answers = answers
    }
}

struct QuestionProvider {
    let questions: [Question] = [
        Question("What is the area in square feet of a rectangle with sides measuring 12 inches and 3 feet?", ["3", "3 SQUARE FEET", "THREE", "THREE SQUARE FEET"]),
        Question("Dudley wanted to paint his room. The area of the room was 180 square meters. If one gallon of paint covers 60 square meters, how much paint does he need?", ["3 GALLONS", "THREE GALLONS"]),
        Question("What is the earth's galaxy called?", ["MILKY WAY", "MILKY WAY GALAXY"]),
        Question("Shakespeare wrote three basic types of plays. One category was histories. Name the other two.", ["COMEDIES AND TRAGEDIES", "TRAGEDIES AND COMEDIES"]),
        Question("These one celled organisms are used in the fermentation process of beer and wine. Name this organism which causes bread to rise.", ["YEAST"]),
        Question("What body of water is the arm of the Arabian Sea lying between Iran and Arabia? This body of water can be entered from the Gulf of Oman through the Strait of Hormuz.", ["PERSIAN GULF"]),
        Question("First and last names, please. Give the pen name of the author of Life on the Mississippi, The Adventures of Tom Sawyer, and The Adventures of Huckleberry Finn.", ["MARK TWAIN"]),
        Question("A certain unknown angle has a supplementary angle that measures 100 degrees. What is the measure of the unknown angle?", ["80 DEGREES", "EIGHTY DEGREES"]),
        Question("What was the name of the international organization founded after World War I that was a forerunner of the United Nations?", ["LEAGE OF NATIONS", "THE LEAGUE OF NATIONS"]),
        Question("Identify the American butterfly remarkable not only for its size and coloration, but for its ability to undertake long migrations.", ["MONARCH", "MONARCH BUTTERFLY", "MONARCH BUTTERFLIES"]),
        Question("World War I was known as The Great War, or The World War, until what event occurred?", ["WORLD WAR II", "WWII", "WORLD WAR TWO"]),
        Question("Paganini was a great Italian composer and musician. Name either of the two musical instruments on which he excelled.", ["PIANO", "VIOLIN"])
        
    ]
    
    func randomQuestion() -> Question {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        return questions[randomNumber]
    }
}
