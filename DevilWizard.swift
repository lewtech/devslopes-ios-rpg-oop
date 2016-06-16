//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Lew Flauta on 6/15/16.
//  Copyright © 2016 Lew Flauta. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
}
    override var type: String {
        return "Devil Wizard"
}
}
