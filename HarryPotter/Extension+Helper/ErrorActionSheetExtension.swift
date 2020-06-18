//
//  ErrorActionSheetExtension.swift
//  HarryPotter
//
//  Created by Victor Monteiro on 6/17/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentErroToUser(error: LocalizedError) {
        
        let alertController = UIAlertController(title: "Error", message: error.errorDescription, preferredStyle: .actionSheet)
        let dismisActionButton = UIAlertAction(title: "Dismiss", style: .cancel)
        alertController.addAction(dismisActionButton)
        present(alertController, animated: true)
    }
}
