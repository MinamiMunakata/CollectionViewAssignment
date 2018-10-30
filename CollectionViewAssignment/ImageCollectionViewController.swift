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
  
  
  
  @IBOutlet weak var segmentControll: UISegmentedControl!
  
  @IBAction func segmentControllTapped(_ sender: UISegmentedControl) {
    collectionView.reloadData()
  }
  
  @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
    // NOTE: press option and shift key to test
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let width = (view.frame.size.width - 48) / 3
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: width, height: width + 18)
    layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
  }
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    if segmentControll.selectedSegmentIndex == 1 {
      return PhotoFactory.Location.allCases.count
    } else {
      return photoFactory.sectionKeys.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: self.view.frame.size.width, height: 30)
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if segmentControll.selectedSegmentIndex != 0 {
      if let location = PhotoFactory.Location(rawValue: section),let photos = photoFactory.byLocation[location] {
        return photos.count
      }
    }
    return (photoFactory.bySubject[photoFactory.sectionKeys[section]]?.count)!
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
    header.backgroundColor = #colorLiteral(red: 0.7424730659, green: 0.625679791, blue: 0.9177659154, alpha: 1)
    if kind == UICollectionView.elementKindSectionHeader {
      if segmentControll.selectedSegmentIndex != 0 {
        header.sectionHeaderLabel.text = PhotoFactory.Location(rawValue: indexPath.section)?.string
      } else {
        header.sectionHeaderLabel.text = photoFactory.sectionKeys[indexPath.section]
      }
      return header
    }
    return UICollectionReusableView()
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // Configure the cell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
    if segmentControll.selectedSegmentIndex == 0 {
      if let photos = photoFactory.bySubject[photoFactory.sectionKeys[indexPath.section]] {
        cell.imageView.image = UIImage(named: photos[indexPath.row].imageName)
        cell.subject.text = photos[indexPath.row].subject
      }
    } else {
      cell.imageView.image = UIImage(named: photoFactory.byLocation[PhotoFactory.Location(rawValue: indexPath.section) ?? PhotoFactory.Location.CICCC]![indexPath.row].imageName)
      cell.subject.text = photoFactory.byLocation[PhotoFactory.Location(rawValue: indexPath.section) ?? PhotoFactory.Location.CICCC]![indexPath.row].subject
    }
    return cell
  }
  

}
