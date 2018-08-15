//
//  ViewController.swift
//  MemeMe
//
//  Created by Rachit Mishra on 15/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    let favoriteThings = [
        "Family",
        "Love",
        "Work"
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteThings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteThingsCell", for:indexPath)
        cell.textLabel?.text = favoriteThings[indexPath.row]
        return cell
    }
}

