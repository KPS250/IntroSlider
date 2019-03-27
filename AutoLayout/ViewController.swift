//
//  ViewController.swift
//  AutoLayout
//
//  Created by Kiran on 26/03/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        view.addSubview(headerDesc)
        
        setupLayout()
        setupBottomControls()
    }
    
    let headerImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "pikachu-2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let headerDesc : UITextView = {
        let attributtedText = NSMutableAttributedString (string: "Pokemon Go", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
        
        attributtedText.append(NSAttributedString(string: "\n\nString message at the bottom of description for represenatational purpose only. Better dont read this out", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSMutableAttributedString.Key.foregroundColor : UIColor.gray]))
        
        let textView = UITextView()
        textView.attributedText = attributtedText
        
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let prevButton : UIButton = {
       let button = UIButton (type: .system)
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton : UIButton = {
        let button = UIButton (type: .system)
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl : UIPageControl = {
        let pcontrol = UIPageControl()
        pcontrol.currentPage = 0
        pcontrol.numberOfPages = 4
        pcontrol.currentPageIndicatorTintColor = .red
        pcontrol.pageIndicatorTintColor = .gray
        return pcontrol
        
    }()

    private func setupLayout(){
        
        let topContainerView = UIView()
        //topContainerView.backgroundColor = .blue
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        //topContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(topContainerView)
        
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.topAnchor.constraint(equalTo : view.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo : view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo : view.trailingAnchor).isActive = true
        
        topContainerView.addSubview(headerImage)
        headerImage.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        headerImage.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        headerImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        headerDesc.topAnchor.constraint(equalTo : topContainerView.bottomAnchor, constant: 20).isActive = true
        headerDesc.leftAnchor.constraint(equalTo : view.safeAreaLayoutGuide.leftAnchor, constant:24).isActive = true
        headerDesc.rightAnchor.constraint(equalTo : view.safeAreaLayoutGuide.rightAnchor, constant:-24).isActive = true
        headerDesc.bottomAnchor.constraint(equalTo : view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    private func setupBottomControls(){
        view.addSubview(prevButton)
        //prevButton.backgroundColor = .red
        //prevButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        view.addSubview(bottomControlStackView)
        
        bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomControlStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }

}

