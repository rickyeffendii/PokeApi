//
//  Pokemon.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation

enum Type: String, Encodable {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case phsychic
    case ice
    case dragon
    case dark
    case fairy
}

enum StatusCondition: String, Encodable {
    case burned
    case asleep
    case confused
    case charmed
    case frozen
    case paralyzed
    case poisoned
    case toxic
    case normal
}

struct Ability {
    let name: String
    let description: String
}

class Pokemon {
    let name: String
    let type1: Type
    let type2: Type?
    let ability: Ability
    let availableMoves: [Move]
    let weight: Double
    let image: String
    let nextEvo: Pokemon?
    let evoLevel: Int?
    
    init(name: String, type1: Type, type2: Type?, ability: Ability, availableMoves: [Move], weight: Double, image: String, nextEvo: Pokemon?, evoLevel: Int?) {
        self.name = name
        self.type1 = type1
        self.type2 = type2
        self.ability = ability
        self.availableMoves = availableMoves
        self.weight = weight
        self.image = image
        self.nextEvo = nextEvo
        self.evoLevel = evoLevel
    }
}

class Move {
    let moveName: String
    let type: Type
    let damage: Int
    let maxPP: Int
    let accuracy: Double
    let statusEffect: StatusCondition
    let acquiredLevel: Int
    
    init(moveName: String, type: Type, damage: Int, maxPP: Int, accuracy: Double, statusEffect: StatusCondition, acquiredLevel: Int) {
        self.moveName = moveName
        self.type = type
        self.damage = damage
        self.maxPP = maxPP
        self.accuracy = accuracy
        self.statusEffect = statusEffect
        self.acquiredLevel = acquiredLevel
    }
}
