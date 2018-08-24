//
//  ViewController.swift
//  MemeMe
//
//  Created by Rachit Mishra on 15/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class SentItemListController: UITableViewController {
    

    var memes: [Meme?] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tcell", for:indexPath) as! MemeListCell
        cell.header.text = self.memes[indexPath.row]?.header
        cell.photo.image = self.memes[indexPath.row]?.memedImage
        return cell
    }
}

