//
//  HarryPotterListTableViewController.swift
//  HarryPotter
//
//  Created by Victor Monteiro on 6/17/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

import UIKit

class HarryPotterListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHarryPotter()
    }
    
    var harryPotter: [HarryPotter] = []
    var imageArray: [UIImage] = []
    
    func fetchHarryPotter() {
        HarryPotterController.fetchWhiches { (results) in
            switch results {
            case .success(let hP):
                self.harryPotter = hP
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.presentErroToUser(error: error)
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.harryPotter.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "hpCell", for: indexPath) as? HarryPotterTableViewCell else { return UITableViewCell() }
        
        let harry = harryPotter[indexPath.row]
        
        // Configure the cell...
        cell.hp = harry
        cell.delegate = self
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVc" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            guard let cell = tableView.cellForRow(at: index) as? HarryPotterTableViewCell else { return }
            let hp = harryPotter[index.row]
            guard let destination = segue.destination as? DetailViewController else { return }
            destination.hp = hp
            destination.harryPotterImage = cell.hpImage
            
        }
    }
}

extension HarryPotterListTableViewController: PresentErrorToUserDelegate {
    
    func presentError(error: LocalizedError) {
        presentErroToUser(error: error)
    }
}
