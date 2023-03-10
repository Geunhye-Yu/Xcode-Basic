//
//  ViewController.swift
//  Project4
//
//  Created by Geunhye Yu on 2023/03/08.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var progressview: UIProgressView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style:.plain, target: self, action: #selector(openTapped))
        
        // ** UIView subclasses: UIToolbar and UIProgressView
        //For Progress bar
        progressview = UIProgressView(progressViewStyle: .default)
        progressview.sizeToFit()
        //can't just add UIView subclasses to a UIToolbar, or to the rightBarButtonItem property but a collection of UIBarButtonItem objects
        let progressButton = UIBarButtonItem(customView: progressview)
        
        //For Toolbar
        //the effect of the flexible space automatically taking up as much room as it can on the left
        //it does not functioning like a button or action but just a spacer
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        //add observer that can be notified when the progress is changed
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), context: nil)
        
    }
    
    // when we use addObserver, we need to difine observerValue and removeObserver
    // this method is called an observed value has changed
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressview.progress = Float(webView.estimatedProgress)
        }
    }
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open pages..", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "google.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction){
        let url = URL(string: "https://www." + action.title!)!
        webView.load(URLRequest(url:url))
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }


}

