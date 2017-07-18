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
    
    func checkAnswer(for playerAnswer: String) -> Bool {
        
        for answer in self.answers {
            if playerAnswer.uppercased() == answer {
                return true
            } //else {
                //return false
            //}
        }
        
        /*if playerAnswer.uppercased() == self.answers[0] {
            return true
        } else {
            return false
        }*/
        return false
    }
}

struct QuestionProvider {
    let questions: [Question] = [
        Question("What is the area in square feet of a rectangle with sides measuring 12 inches and 3 feet?", ["3", "3 SQUARE FEET", "THREE", "THREE SQUARE FEET"]),
        Question("Dudley wanted to paint his room. The area of the room was 180 square meters. If one gallon of paint covers 60 square meters, how much paint does he need?", ["3 GALLONS", "THREE GALLONS"]),
        Question("What is the earth's galaxy called?", ["MILKY WAY", "MILKY WAY GALAXY", "THE MILKY WAY", "THE MILKY WAY GALAXY"]),
        Question("Shakespeare wrote three basic types of plays. One category was histories. Name the other two.", ["COMEDIES AND TRAGEDIES", "TRAGEDIES AND COMEDIES", "COMEDY AND TRAGEDY", "TRAGEDY AND COMEDY"]),
        Question("These one celled organisms are used in the fermentation process of beer and wine. Name this organism which causes bread to rise.", ["YEAST"]),
        Question("What body of water is the arm of the Arabian Sea lying between Iran and Arabia? This body of water can be entered from the Gulf of Oman through the Strait of Hormuz.", ["PERSIAN GULF"]),
        Question("First and last names, please. Give the pen name of the author of Life on the Mississippi, The Adventures of Tom Sawyer, and The Adventures of Huckleberry Finn.", ["MARK TWAIN"]),
        Question("A certain unknown angle has a supplementary angle that measures 100 degrees. What is the measure of the unknown angle?", ["80 DEGREES", "EIGHTY DEGREES"]),
        Question("What was the name of the international organization founded after World War I that was a forerunner of the United Nations?", ["LEAGUE OF NATIONS", "THE LEAGUE OF NATIONS"]),
        Question("Identify the American butterfly remarkable not only for its size and coloration, but for its ability to undertake long migrations.", ["MONARCH", "MONARCH BUTTERFLY", "MONARCH BUTTERFLIES"]),
        Question("World War One was known as The Great War, or The World War, until what event occurred?", ["WORLD WAR II", "WWII", "WORLD WAR TWO"]),
        Question("Paganini was a great Italian composer and musician. Name either of the two musical instruments on which he excelled.", ["PIANO", "VIOLIN"]),
        Question("Nate and Miranda were tiling a square kitchen floor using tiles measuring 1 foot by 1 foot. If they used 81 tiles, what are the dimensions of the floor?", ["NINE FEET BY NINE FEET"]),
        Question("How many states have the Mississippi River as part of their border?", ["10", "TEN"]),
        Question("What is one fourth plus one third?", ["7/12", "SEVEN TWELFTHS", "SEVEN OVER TWELVE", "712", "712s"]),
        Question("In doing research, you may see such phrases as 'see' or 'see also.' What are these phrases that refer you to other topics?", ["CROSS-REFERENCES", "CROSS-REFERENCE", "CROSS REFERENCES", "CROSS REFERENCE"]),
        Question("The atmosphere of the earth is made up of about 20 percent oxygen, 1 percent of trace gases, and 79 percent of what other gas?", ["NITROGEN"]),
        Question("Identify the ancient wind instrument on which the performer blows into a pipe leading to a windbag into which air is squeezed into reed pipes. It is most popular in Scotland.", ["BAGPIPE", "BAGPIPES"]),
        Question("What is the area of a square which has a perimeter of 4 feet?", ["ONE SQUARE FOOT", "ONE FOOT SQUARED"]),
        Question("The Pacific and Atlantic Oceans are the two largest bodies of water on the surface of the Earth. What is the third largest body of water?", ["INDIAN OCEAN"])
        
    ]
    
    func randomQuestion() -> Question {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        return questions[randomNumber]
    }
}
