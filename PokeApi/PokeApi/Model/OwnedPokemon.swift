//
//  OwnedPokemon.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation

class Status {
    var hp: Int
    var att: Int
    var spAtt: Int
    var def: Int
    var spDef: Int
    var speed: Int
    
    init(level: Int) {
        self.hp = Int.random(in: level*4...level*5)
        self.att = Int.random(in: level*2...level*3)
        self.spAtt = Int.random(in: level*2...level*3)
        self.def = Int.random(in: level*2...level*3)
        self.spDef = Int.random(in: level*2...level*3)
        self.speed = Int.random(in: level*2...level*3)
    }
    
    func evolved() {
        self.hp += 50
        self.att += 20
        self.spAtt += 20
        self.def += 20
        self.spDef += 20
        self.speed += 20
    }
    
    func levelUp() {
        self.hp += Int.random(in: 4...5)
        self.att += Int.random(in: 1...2)
        self.spAtt += Int.random(in: 1...2)
        self.def += Int.random(in: 1...2)
        self.spDef += Int.random(in: 1...2)
        self.speed += Int.random(in: 1...2)
    }
}

struct Item {
    let name: String
    let effect: String
    let description: String
}

class OwnedPokemon {
    var pokemon: Pokemon
    var nickname: String
    var currentRename: Int
    var nextRename: Int
    var statusCondition: StatusCondition
    var status: Status
    var moves: [Move]
    var level: Int
    var experience: Int
    var heldItems: Item?
    var isRenamed: Bool
    
    init(pokemon: Pokemon, nickname: String, currentRename: Int = 0, nextRename: Int = 1, statusCondition: StatusCondition, status: Status, moves: [Move], level: Int, experience: Int, heldItems: Item? = nil, isRenamed: Bool = false) {
        self.pokemon = pokemon
        self.nickname = nickname
        self.currentRename = currentRename
        self.nextRename = nextRename
        self.statusCondition = statusCondition
        self.status = status
        self.moves = moves
        self.level = level
        self.experience = experience
        self.heldItems = heldItems
        self.isRenamed = isRenamed
    }
    
    private func levelUp() {
        experience = experience - (level * 100)
        level += 1
        status.levelUp()
        if let nextEvo = pokemon.nextEvo, let evoLevel = nextEvo.evoLevel, level > evoLevel {
            self.evolve(nextEvo: nextEvo)
        }
    }
    
    private func evolve(nextEvo: Pokemon) {
        pokemon = nextEvo
        status.evolved()
    }
    
    func rename() {
        if isRenamed {
            let tempRename = currentRename + nextRename
            currentRename = nextRename
            nextRename = tempRename
        } else {
            isRenamed = true
        }
    }
    
    func gainExperience(exp: Int) {
        experience += exp
        if experience > level * 100 {
            self.levelUp()
        }
    }
}
