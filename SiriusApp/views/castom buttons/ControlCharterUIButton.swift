//
//  SmallCharterUIButton.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit



class ControlCharterUIButton: UIButton {
    
    var controlLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = ""
        return label
    }()
    
    var imageButton = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 6
        self.layer.borderColor = #colorLiteral(red: 0.6566315889, green: 0.720035255, blue: 0.8156996369, alpha: 1)
        self.layer.borderWidth = 1
        setupLayout()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(controlLabel)
        controlLabel.translatesAutoresizingMaskIntoConstraints = false
        controlLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        controlLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -9).isActive = true
        controlLabel.widthAnchor.constraint(equalToConstant: 64).isActive = true
        
        imageButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageButton)
        imageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 13).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
