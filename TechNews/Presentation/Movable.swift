//
//  Movable.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/11/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import Foundation
import UIKit

protocol Movable {
  func moveToPosition<T: UIView>(in miliSEconds: Double, y: CGFloat, fromView view: T)
}

extension Movable {
  func moveToPosition<T: UIView>(in miliSeconds: Double, y: CGFloat, fromView view: T) {
    let x: CGFloat = 0.0
    let z: CGFloat = 0.0
    let rotationTransform = CATransform3DMakeTranslation(x, y, z)
    view.layer.transform = rotationTransform
    view.alpha = 0
    UIView.animate(withDuration: miliSeconds, delay: 0, options: [.curveEaseIn, .allowUserInteraction], animations: {
        view.layer.transform = CATransform3DIdentity
        view.alpha = 1
    })
  }
}
