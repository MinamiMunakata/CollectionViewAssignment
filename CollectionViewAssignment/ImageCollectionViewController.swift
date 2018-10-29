//
//  ImageCollectionViewController.swift
//  CollectionViewAssignment
//
//  Created by minami on 2018-10-29.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ImageCollectionViewController: UICollectionViewController {
  
  @IBAction func segmentControllTapped(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
      // subject
      
      
    } else {
      // location
      
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 10
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
    
    // Configure the cell
    
    return cell
  }
  
  
}
