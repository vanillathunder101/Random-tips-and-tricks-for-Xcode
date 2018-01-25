//
//  ViewController.swift
//  textViewAutosizing
//
//  Created by blueberry on 25/01/2018.
//  Copyright © 2018 Andrii Pazynych. All rights reserved.
//

import UIKit

class TextViewTest: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        view.backgroundColor = UIColor.white
        view.addSubview(textView)
        [
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.heightAnchor.constraint(equalToConstant: 50),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ].forEach { $0.isActive = true }

        textViewDidChange(textView)
    }
    
    lazy var textView: UITextView = {
        
        let tv = UITextView()
        tv.backgroundColor = .white
        tv.text = "some random text to test the autosizing feature of the textview and see the number of lines and whatever"
        tv.font = UIFont.preferredFont(forTextStyle: .headline)
        tv.layer.cornerRadius = 10
        tv.layer.borderWidth = 2
        tv.layer.borderColor = UIColor.purple.cgColor
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isScrollEnabled = false
        tv.delegate = self
        return tv
    }()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension TextViewTest: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach {
            if $0.firstAttribute == NSLayoutAttribute.height {
                $0.constant = estimatedSize.height
                
            }
        }
        
    }
    
}
