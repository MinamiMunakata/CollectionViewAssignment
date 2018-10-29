//
//  PhotoFactory.swift
//  CollectionViewAssignment
//
//  Created by minami on 2018-10-29.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import Foundation

// MARK

struct PhotoFactory {
  var images: [Photo]
  
  init() {
    images = [Photo]()
    images += [
      Photo(subject: "", location: "", imageName: "kitty1"),
      Photo(subject: "", location: "", imageName: "kitty2"),
      Photo(subject: "", location: "", imageName: "kitty3"),
      Photo(subject: "", location: "", imageName: "kitty4"),
      Photo(subject: "", location: "", imageName: "kitty5")
    ]
  }
}
