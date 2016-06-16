//
//  Kimara.swift
//  rpgoop
//
//  Created by Lew Flauta on 6/15/16.
//  Copyright © 2016 Lew Flauta. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    //attack that comes in under 15 is immune, and +1 hitpoint
    let IMMUNE_MAX = 15
    override var loot: [String]{
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }

    override var type: String {
        return "Kimara"
    }

    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        }else {
            return false
        }
    }
}