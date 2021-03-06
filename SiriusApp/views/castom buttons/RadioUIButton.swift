//
//  SmallCharterUIButton.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class RadioUIButton: UIButton {
    
  
    
    var smallLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.contentScaleFactor = 0.2
        label.sizeToFit()
        label.text = ""
        return label
    }()
    
    public var isChecked = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        setupLayout()
    }
    
    var imageButton = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func changeState(){
        
        if isChecked {
            isChecked = false
            imageButton.image = UIImage(named: "noselectedRadio")
        } else {
            isChecked = true
            imageButton.image = UIImage(named: "selectedRadio")
        }
        
    }
    
    public func setInitial(state : Bool) {
        if state {
            isChecked = true
            imageButton.image = UIImage(named: "selectedRadio")
            
        } else {
            isChecked = false
            imageButton.image = UIImage(named: "noselectedRadio")
        }
    }
    
    func setupLayout() {
        self.backgroundColor = UIColor.clear
        
        
        imageButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageButton)
        imageButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        imageButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(smallLabel)
        smallLabel.translatesAutoresizingMaskIntoConstraints = false
        smallLabel.leftAnchor.constraint(equalTo: imageButton.rightAnchor, constant: 10).isActive = true
        smallLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
