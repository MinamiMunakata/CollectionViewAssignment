//
//  PhotoFactory.swift
//  CollectionViewAssignment
//
//  Created by minami on 2018-10-29.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import Foundation

// MARK

class PhotoFactory {
  var images: [Photo]
  var bySubject: [String: [Photo]] // alph and photos
  var byLocation: [Location: [Photo]]
  
  enum Location: Int, CaseIterable {
    case CICCC, iconfinder
    
    var string: String {
      return String("\(self)")
    }
    
  }
  
  init() {
    images = [Photo]()
    images += [
      Photo(subject: "kitty1", location: Location.CICCC, imageName: "kitty1"),
      Photo(subject: "kitty2", location: Location.CICCC, imageName: "kitty2"),
      Photo(subject: "kitty3", location: Location.CICCC, imageName: "kitty3"),
      Photo(subject: "kitty4", location: Location.CICCC, imageName: "kitty4"),
      Photo(subject: "kitty5", location: Location.CICCC, imageName: "kitty5"),
      Photo(subject: "boo ghost", location: Location.iconfinder, imageName: "halloween-boo-ghost-phantom-scary"),
      Photo(subject: "halloween calendar", location: Location.iconfinder, imageName: "halloween-calendar"),
      Photo(subject: "halloween cat", location: Location.iconfinder, imageName: "halloween-cat"),
      Photo(subject: "coffin", location: Location.iconfinder, imageName: "halloween-coffin-vampire"),
      Photo(subject: "spider web", location: Location.iconfinder, imageName: "halloween-spider-web"),
      Photo(subject: "horror castle", location: Location.iconfinder, imageName: "halloween-horror-castle"),
      Photo(subject: "halloween pumpkin", location: Location.iconfinder, imageName: "halloween-pumpkin"),
      Photo(subject: "trick or treat", location: Location.iconfinder, imageName: "halloween-candy"),
      Photo(subject: "R.I.P", location: Location.iconfinder, imageName: "halloween-graveyard"),
      Photo(subject: "halloween bats", location: Location.iconfinder, imageName: "halloween-bat")
    ]
    
    images = images.sorted { $0.subject < $1.subject }
    bySubject = [:]
    for photo in images {
      let initial = photo.subject.prefix(1)
      var array = [Photo]()
      if bySubject[String(initial)] != nil {
        var val = bySubject[String(initial)]
        val?.append(photo)
        bySubject[String(initial)] = val
      } else {
        array.removeAll()
        array.append(photo)
        bySubject[String(initial)] = array
      }
    }
    print("HashMap: \(bySubject.count)")
    print(bySubject)
    byLocation = [:]
    var arr = [Photo]()
    for location in Location.allCases {
      arr = images.filter { $0.location == location }
      byLocation[location] = arr
      arr.removeAll()
    }
    
  }
}

