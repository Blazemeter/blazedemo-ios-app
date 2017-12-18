//
//  ViewController.swift
//  BlazeDemo
//
//  Created by Jambu, Vijay on 12/18/17.
//  Copyright © 2017 Jambu, Vijay. All rights reserved.
//

import UIKit
import WebKit
import os.log

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url:URL? = URL(string: "http://www.blazedemo.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        os_log("navigation finished for webview %@",webView.url!.absoluteString)
        print("navigation finished for webview \(webView.url!.absoluteString)")
        title = webView.title
    }

}

