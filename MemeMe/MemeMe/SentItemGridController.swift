//
//  ViewController.swift
//  MemeMe
//
//  Created by Rachit Mishra on 15/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

class SentItemGridController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    override func viewDidAppear(_ animated: Bool) {
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    var memes: [Meme?] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Access
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as! MemeCell
        cell.header?.text = memes[indexPath.row]?.header
        cell.photo?.image = memes[indexPath.row]?.memedImage
        cell.backgroundColor = UIColor(red: 1, green: 2, blue: 1, alpha: 1)
        return cell
    }
    
}

