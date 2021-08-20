//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 성기훈 on 2021/08/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet var wv: WKWebView!
    var mvo: MovieVO!
    
    override func viewDidLoad() {
        NSLog("linkurl = \(self.mvo.detail!), title=\(self.mvo.title!)")
        
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        let url = URL(string: (self.mvo.detail!))
        let req = URLRequest(url: url!)
        
        self.wv.load(req)
    }
    
}
