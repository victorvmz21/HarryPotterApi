//
//  HarryPotterTableViewCell.swift
//  HarryPotter
//
//  Created by Victor Monteiro on 6/17/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

import UIKit

protocol  PresentErrorToUserDelegate: AnyObject {
    func presentError(error: LocalizedError)
}

class HarryPotterTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var harryPotterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    var hp: HarryPotter? {
        didSet{
            updateViews()
        }
    }
    
    var hpImage: UIImage?
    
    weak var delegate: PresentErrorToUserDelegate?
    
    func updateViews() {
        guard let harryPotter = hp else { return }
        nameLabel.text = harryPotter.name
        houseLabel.text = harryPotter.house ?? "No House"
        harryPotterImageView.image = nil
        
        HarryPotterController.fetchImages(harryPotter: harryPotter) { (result) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.harryPotterImageView.image = image
                    self.hpImage = image
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.delegate?.presentError(error: error)
                }
                print(error.localizedDescription)
            }
        }
    }
}
