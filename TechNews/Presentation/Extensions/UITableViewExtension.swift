//
//  UITableViewExtension.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import UIKit

extension UITableView {
  
  func register<T: UITableViewCell>(_ cell: T.Type) {
    let nibName = String(describing: T.self)

    register(cell, forCellReuseIdentifier: nibName)
  }
  
  func reusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
    let reuseIdentifier = String(describing: T.self)
    
    guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
      fatalError("Expected cell to be of type \(reuseIdentifier)")
    }
    
    return cell
  }
}
