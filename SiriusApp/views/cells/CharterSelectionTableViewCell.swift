//
//  CharterSelectionTableViewCell.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class CharterSelectionTableViewCell: UITableViewCell {
    
    let backView = UIView()
    let timeButton = SmallCharterUIButton()
    let dateButton = SmallCharterUIButton()
    let passengerButton = SmallCharterUIButton()
    let departureButton = BigCharterUIButton()
    let arivalButton = BigCharterUIButton()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupLayout() {
        
        backView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        self.contentView.addSubview(backView)
        backView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        backView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        
        
        timeButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
        timeButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(timeButton)
        timeButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        timeButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
        timeButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        timeButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
        timeButton.imageButton.image = UIImage(named: "clocksmall")
        timeButton.smallLabel.text = "Время"
        
        dateButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
        dateButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(dateButton)
        dateButton.rightAnchor.constraint(equalTo: timeButton.leftAnchor, constant: -1).isActive = true
        dateButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
        dateButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        dateButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
        dateButton.imageButton.image = UIImage(named: "calendar")
        dateButton.smallLabel.text = "Выбрать дату"
        
        passengerButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
        passengerButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(passengerButton)
        passengerButton.leftAnchor.constraint(equalTo: timeButton.rightAnchor, constant: 1).isActive = true
        passengerButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
        passengerButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        passengerButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
        passengerButton.imageButton.image = UIImage(named: "seat")
        passengerButton.smallLabel.text = "Пассажир"
        
        
        departureButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
        departureButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(departureButton)
        departureButton.leftAnchor.constraint(equalTo: dateButton.leftAnchor, constant: 0).isActive = true
        departureButton.bottomAnchor.constraint(equalTo: dateButton.topAnchor, constant: -1).isActive = true
        departureButton.heightAnchor.constraint(equalToConstant: 127).isActive = true
        departureButton.widthAnchor.constraint(equalToConstant: 173).isActive = true
        departureButton.bigLabel.text = "Откуда"
        
        arivalButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
        arivalButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(arivalButton)
        arivalButton.rightAnchor.constraint(equalTo: passengerButton.rightAnchor, constant: 0).isActive = true
        arivalButton.bottomAnchor.constraint(equalTo: passengerButton.topAnchor, constant: -1).isActive = true
        arivalButton.heightAnchor.constraint(equalToConstant: 127).isActive = true
        arivalButton.widthAnchor.constraint(equalToConstant: 173).isActive = true
        arivalButton.bigLabel.text = "Куда"
        
        
        
        
        
        
    }
    
    
}
