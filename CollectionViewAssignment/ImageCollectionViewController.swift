//
//  ImageCollectionViewController.swift
//  CollectionViewAssignment
//
//  Created by minami on 2018-10-29.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ImageCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var photoFactory = PhotoFactory()
  var sortedPhotos = [Photo]()
  
  
  
  @IBOutlet weak var segmentControll: UISegmentedControl!
  
  @IBAction func segmentControllTapped(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
      // subject
      photoFactory.bySubject = photoFactory.images.sorted { $0.subject < $1.subject }
      sortedPhotos = photoFactory.bySubject
      collectionView.reloadData()
    } else {
      // location
      collectionView.reloadData()
      print(segmentControll.selectedSegmentIndex)
    }
  }
  
  @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
    // NOTE: press option and shift key to test
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let width = (view.frame.size.width - 48) / 3
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: width, height: width)
    layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
  }
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    if segmentControll.selectedSegmentIndex == 1 {
      return PhotoFactory.Location.allCases.count
    } else {
      return 1
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if segmentControll.selectedSegmentIndex == 0 {
      return CGSize.zero
    } else {
      return CGSize(width: self.view.frame.size.width, height: 30)
    }
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if segmentControll.selectedSegmentIndex != 0 {
      if let location = PhotoFactory.Location(rawValue: section),let photos = photoFactory.byLocation[location] {
        return photos.count
      }
    }
    return photoFactory.images.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
    header.backgroundColor = #colorLiteral(red: 0.7424730659, green: 0.625679791, blue: 0.9177659154, alpha: 1)
    if kind == UICollectionView.elementKindSectionHeader {
      header.sectionHeaderLabel.text = PhotoFactory.Location(rawValue: indexPath.section)?.string
      return header
    }
    return UICollectionReusableView()
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // Configure the cell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
    if segmentControll.selectedSegmentIndex == 0 {
      cell.imageView.image = UIImage(named: photoFactory.images[indexPath.item].imageName)
    } else {
      print("Section \(indexPath.section)\n")
      print("Item: \(indexPath.row)\n")
      print(photoFactory.byLocation[PhotoFactory.Location(rawValue: indexPath.section)!]![indexPath.row].imageName)
      print("\n")
      print(photoFactory.byLocation[PhotoFactory.Location(rawValue: indexPath.section)!]!)
      
      cell.imageView.image = UIImage(named: photoFactory.byLocation[PhotoFactory.Location(rawValue: indexPath.section) ?? PhotoFactory.Location.CICCC]![indexPath.row].imageName)
    }
    return cell
  }
  
  
  
}
