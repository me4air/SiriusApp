//
//  SmallCharterUIButton.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class LongDealUIButton: UIButton {
    
    /*var smallLabel: UILabel = {
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
    }()*/
    
    var smallLabel: UITextField = {
        let label = UITextField()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      //  label.numberOfLines = 1
      //  label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.contentScaleFactor = 0.2
        label.sizeToFit()
        label.text = ""
        label.isEnabled = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        setupLayout()
    }
    
    var imageButton = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.backgroundColor = UIColor.clear
        self.addSubview(smallLabel)
        smallLabel.translatesAutoresizingMaskIntoConstraints = false
        smallLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        smallLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        smallLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50).isActive = true
        
        imageButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageButton)
        imageButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -17).isActive = true
        imageButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 14).isActive = true
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
