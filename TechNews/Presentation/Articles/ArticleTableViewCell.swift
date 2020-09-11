//
//  ArticleTableViewCell.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/9/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell, Reducible, Movable {

  lazy var titlelabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textColor = UIColor.label
    label.numberOfLines = 0
    return label
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = UIColor.secondaryLabel
    label.numberOfLines = 1
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
      
    render()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}

extension ArticleTableViewCell: Renderizable {
  
  func render() {
      contentView.addSubview(titlelabel)
      contentView.addSubview(descriptionLabel)
      
      titlelabel.snp.makeConstraints {
        $0.left.equalToSuperview().offset(16)
        $0.right.equalToSuperview().offset(-16)
        $0.top.equalToSuperview().offset(24)
      }
    
      descriptionLabel.snp.makeConstraints {
        $0.left.equalToSuperview().offset(16)
        $0.right.equalToSuperview().offset(-16)
        $0.top.equalTo(titlelabel.snp.bottom).offset(4)
        $0.bottom.equalToSuperview().offset(-24)
      }
  }
}
