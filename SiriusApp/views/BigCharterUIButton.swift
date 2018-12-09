//
//  SmallCharterUIButton.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class BigCharterUIButton: UIButton {
    
    var bigLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = ""
        return label
    }()
    
    var bigDesckrLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "ВЫБЕРИТЕ АЭРОПОРТ"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.3607843137, blue: 0.6, alpha: 1)
        setupLayout()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(bigLabel)
        bigLabel.translatesAutoresizingMaskIntoConstraints = false
        bigLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bigLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 37).isActive = true
        
        self.addSubview(bigDesckrLabel)
        bigDesckrLabel.translatesAutoresizingMaskIntoConstraints = false
        bigDesckrLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bigDesckrLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        bigDesckrLabel.topAnchor.constraint(equalTo: bigLabel.bottomAnchor, constant: 3).isActive = true
        

        
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
