//
//  Reducible.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Foundation
import UIKit

protocol Reducible {
  func reduceSize<T: UIView>(fromView view: T)
  func normalSize<T: UIView>(fromView view: T)
}

extension Reducible {
  func reduceSize<T: UIView>(fromView view: T) {
    UIView.animate(withDuration: 0.3) {
      view.self.transform = .init(scaleX: 0.95, y: 0.95)
    }
  }

  func normalSize<T: UIView>(fromView view: T) {
    UIView.animate(withDuration: 0.5) {
      view.self.transform = .identity
    }
  }
}
