//
//  ViewController.swift
//  rpgoop
//
//  Created by Lew Flauta on 6/15/16.
//  Copyright © 2016 Lew Flauta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var enemyHpLabel: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var chestButton: UIButton!

    @IBAction func onChestTapped(sender: AnyObject) {
        chestButton.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }

    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        printLabel.text = ""
        player = Player(name: "SirLewk", hp: 110, attackPwr: 20)
        playerHpLabel.text = "\(player.hp) HP"// Do any additional setup after loading the view, typically from a nib.

        generateRandomEnemy()
    }


    func generateRandomEnemy() {

        let rand = Int(arc4random_uniform(2))
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 30, attackPwr: 30)
        }
        enemyImage.hidden = false
        enemyHpLabel.text = "\(enemy.hp) HP"
    }

    @IBAction func onAttackTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr){
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
        }else {
            printLabel.text = "Attack was unsuccessful!"
        }

        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false

        }

        if !enemy.isAlive {
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
            chestButton.hidden = false
        }
    }






}

