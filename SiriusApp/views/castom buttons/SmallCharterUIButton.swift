//
//  SmallCharterUIButton.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class SmallCharterUIButton: UIButton {
    
    var smallLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = ""
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.3607843137, blue: 0.6, alpha: 1)
        setupLayout()
    }
    
    var imageButton = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(smallLabel)
        smallLabel.translatesAutoresizingMaskIntoConstraints = false
        smallLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        smallLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        imageButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageButton)
        imageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
