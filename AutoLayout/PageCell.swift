//
//  PageCell.swift
//  AutoLayout
//
//  Created by Kiran on 27/03/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell{
    
    var page : Page?{
        didSet{
            //print(page?.image)
            guard let unwrappedPage = page else { return }
           
            let attributtedText = NSMutableAttributedString (string: unwrappedPage.title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
            
            attributtedText.append(NSAttributedString(string: "\n\n" + unwrappedPage.desc, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSMutableAttributedString.Key.foregroundColor : UIColor.gray]))
            
             headerDesc.attributedText = attributtedText
             headerDesc.textAlignment = .center
             headerImage.image = UIImage(named: unwrappedPage.image)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let headerImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "pikachu-2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let headerDesc : UITextView = {
        
        
        let textView = UITextView()
        
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private func setupLayout(){
        
        let topContainerView = UIView()
        //topContainerView.backgroundColor = .blue
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topContainerView)
        addSubview(headerDesc)
        
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.topAnchor.constraint(equalTo : topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo : leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo : trailingAnchor).isActive = true
        
        topContainerView.addSubview(headerImage)
        headerImage.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        headerImage.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        headerImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        headerDesc.topAnchor.constraint(equalTo : topContainerView.bottomAnchor, constant: 20).isActive = true
        headerDesc.leftAnchor.constraint(equalTo : safeAreaLayoutGuide.leftAnchor, constant:24).isActive = true
        headerDesc.rightAnchor.constraint(equalTo : safeAreaLayoutGuide.rightAnchor, constant:-24).isActive = true
        headerDesc.bottomAnchor.constraint(equalTo : bottomAnchor, constant: 0).isActive = true
    }

}
