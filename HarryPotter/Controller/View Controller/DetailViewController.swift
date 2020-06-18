//
//  DetailViewController.swift
//  HarryPotter
//
//  Created by Victor Monteiro on 6/18/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var actorAliveLabel: UILabel!
    
    //MARK: - Variables
    var hp: HarryPotter?
    var harryPotterImage: UIImage?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let hp = hp else {return}
        characterNameLabel.text = hp.name
        houseLabel.text = hp.house
        actorNameLabel.text = hp.actor
        characterImageView.image = harryPotterImage
        
        if hp.alive {
             actorAliveLabel.text = "Alive"
        } else {
             actorAliveLabel.text = "Dead"
        }
    }
}
