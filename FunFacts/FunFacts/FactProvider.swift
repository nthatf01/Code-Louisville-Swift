//
//  FactProvider.swift
//  FunFacts
//
//  Created by Nathaniel Hatfield on 5/16/17.
//  Copyright © 2017 Nathaniel Hatfield. All rights reserved.
//

import Foundation
import GameKit

struct FactProvider {
    let facts = [
        "Ants stretch when they wake up in the morning",
        "Ostriches run faster than horses",
        "Olympic gold medals are actually mostly made of silver",
        "You are born with 300 bones; by the time you are an adult you will have 206",
        "It takes about eight minutes for light from the sun to reach the Earth",
        "Some bamboo plants can grow over a meter in a single day",
        "The state of Florida is larger than England",
        "Some penguins can leap two to three meters out of the water",
        "On average it takes 66 days to form a new habit",
        "Mammoths still walked the Earth when the Great Pyramids were being built"]
    
    func randomFact() -> String {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: facts.count)
        return facts[randomNumber]
    }
}
