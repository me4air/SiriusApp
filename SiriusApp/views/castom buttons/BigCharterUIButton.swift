//
//  SmallCharterUIButton.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

enum BigButtonSide {
    case left
    case right
}

class BigCharterUIButton: UIButton {
    
    var buttonSide: BigButtonSide = .left
    
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
    
    
    var destLabel: UILabel = {
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
        label.text = "Откуда"
        return label
    }()
    
    var codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "DME"
        return label
    }()
    
    var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Domodedovo airport Moscow Russia"
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
        
        self.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.3607843137, blue: 0.6, alpha: 1)
        
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
    
    func clearButtonLayout(){
        for v in self.subviews{
            v.removeFromSuperview()
        }
        self.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.3607843137, blue: 0.6, alpha: 1)
        setupLayout()
    }
    
    func reloadButtonWithData(dest: String, code: String, city: String){
       /* for v in self.subviews{
            v.removeFromSuperview()
        }*/
        self.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        
        self.destLabel.text = dest
        self.codeLabel.text = code
        self.cityLabel.text = city
    }
    
    func stupSelectedLayout(){
        for v in self.subviews{
            v.removeFromSuperview()
        }
        self.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        destLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        switch buttonSide {
        case .left:
            
            self.addSubview(destLabel)
            destLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
            destLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
           
            self.addSubview(codeLabel)
            codeLabel.topAnchor.constraint(equalTo: destLabel.bottomAnchor, constant: 20).isActive = true
            codeLabel.leftAnchor.constraint(equalTo: destLabel.leftAnchor).isActive = true
            
            self.addSubview(cityLabel)
            cityLabel.leftAnchor.constraint(equalTo: destLabel.leftAnchor).isActive = true
            cityLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 2).isActive = true
            cityLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
        case .right:


            self.addSubview(destLabel)
            destLabel.text = "Куда"
            destLabel.textAlignment = .right
            destLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
            destLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            
            self.addSubview(codeLabel)
            codeLabel.textAlignment = .right
            codeLabel.topAnchor.constraint(equalTo: destLabel.bottomAnchor, constant: 20).isActive = true
            codeLabel.rightAnchor.constraint(equalTo: destLabel.rightAnchor).isActive = true
            
            self.addSubview(cityLabel)
            cityLabel.textAlignment = .right
            cityLabel.rightAnchor.constraint(equalTo: destLabel.rightAnchor).isActive = true
            cityLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 2).isActive = true
            cityLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
