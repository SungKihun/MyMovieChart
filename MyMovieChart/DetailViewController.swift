//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 성기훈 on 2021/08/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var wv: WKWebView!
    var mvo: MovieVO!
    
    override func viewDidLoad() {
        self.wv.navigationDelegate = self
        
        NSLog("linkurl = \(self.mvo.detail!), title=\(self.mvo.title!)")
        
        let navibar = self.navigationItem
        
        navibar.title = self.mvo.title
        
//        title = self.mvo.title // 이것도 돌아감
        
        let url = URL(string: (self.mvo.detail!))
        let req = URLRequest(url: url!)
        
        self.wv.load(req)
    }
    
}

extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}

extension UIViewController {
    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
            onClick?()
        }))
        
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
    }
}
