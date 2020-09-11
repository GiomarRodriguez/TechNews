//
//  ArticleViewController.swift
//  TechNews
//
//  Created by Giomar Rodriguez on 9/10/20.
//  Copyright © 2020 Giomar Rodriguez. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {
  
  public var url: String = ""
  public var presenter: ArticlePresenter?
  
  lazy var webView: WKWebView = {
    let webView = WKWebView(frame: CGRect.zero)
    webView.navigationDelegate = self
    webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    webView.backgroundColor = .clear
    return webView
  }()
  
  lazy var progressView: UIProgressView = {
    let view = UIProgressView(progressViewStyle: .bar)
    view.progress = 0.0
    view.alpha = 0
    view.isHidden = true
    view.tintColor = UIColor.systemBlue
    view.trackTintColor = UIColor.systemGray3
    return view
  }()


  override func viewDidLoad() {
    super.viewDidLoad()
      
    render()
    
    guard let presenter = presenter else {
      fatalError("Expected of type \(String(describing: ArticlePresenter.self))")
    }

    presenter.load(url)
  }
}

extension ArticleViewController: ArticleView {
  
  func present(article: String) {
    webView.load(URLRequest.init(url: URL.init(string: article)!))
  }
}

extension ArticleViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      hideProgress()
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      showProgress()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
      if keyPath == "estimatedProgress" {
        progressView.setProgress(Float(webView.estimatedProgress), animated: true)
      }
    }
}

extension ArticleViewController: Renderizable {
  
  func render() {
    view.backgroundColor = UIColor.white
    setupWebView()
    setupProgressView()
  }
  
  private func setupWebView() {
    view.addSubview(webView)
    webView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
    }
  }
  
  func setupProgressView() {
    view.addSubview(progressView)
    progressView.snp.makeConstraints { make in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(webView.snp.top)
    }
  }
  
  private func showProgress() {
    progressView.isHidden = false
    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
      self.progressView.alpha = 1
    }, completion: { _ in
      self.progressView.setProgress(0.1, animated: true)
    })
  }

  private func hideProgress() {
    progressView.setProgress(1, animated: true)
    UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
      self.progressView.alpha = 0
    }, completion: { _ in
      self.progressView.isHidden = true
      self.progressView.setProgress(0.0, animated: false)
    })
  }

}
