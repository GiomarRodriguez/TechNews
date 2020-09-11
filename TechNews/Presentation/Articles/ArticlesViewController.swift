//
//  ArticlesViewController.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/9/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import UIKit
import SnapKit

class ArticlesViewController: UIViewController {

  private var data: [Article] = []
  
  public var presenter: ArticlesPresenter?
  
  lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.register(ArticleTableViewCell.self)
    tableView.dataSource = self
    tableView.delegate = self
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    render()
    
    guard let presenter = presenter else {
      fatalError("Expected of type \(String(describing: ArticlesPresenter.self))")
    }

    presenter.fetchArticles()
  }
  
  private func open(article: Article) {
    presenter?.openArticle(article)
  }
}

extension ArticlesViewController: ArticlesView {
  func present(articles: [Article]) {
    data = articles
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.tableView.reloadData()
    }
  }
  
  func navigateTo(article: ArticleViewController) {
    article.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(article, animated: true)
  }
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.reusableCell(for: indexPath) as ArticleTableViewCell
    cell.selectionStyle = .none
    cell.titlelabel.text = data[indexPath.item].title
    cell.descriptionLabel.text = data[indexPath.item].author
    return cell
  }
  
  func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath), let reducible = cell as? Reducible else {
      return
    }
    
    reducible.reduceSize(fromView: cell)
  }
  
  func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath), let reducible = cell as? Reducible else {
      return
    }
    
    reducible.normalSize(fromView: cell)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    open(article: data[indexPath.item])
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      data.remove(at: indexPath.item)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
}

extension ArticlesViewController: Renderizable {
  
  func render() {
    view.backgroundColor = UIColor.white
    setupTableView()
  }
  
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints {
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
      $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
    }
  }
}

