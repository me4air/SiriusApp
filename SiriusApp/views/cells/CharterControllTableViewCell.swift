//
//  CharterControllTableViewCell.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class CharterControllTableViewCell: UITableViewCell {
    
    let addButton = ControlCharterUIButton()
    let backButton = ControlCharterUIButton()
    let clearButton = ControlCharterUIButton()
    
    let controlButtonWidth = Double(UIScreen.main.bounds.width)/3 - 24

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
    
    func setupLayout(){
        addButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addButton)
        addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: CGFloat(controlButtonWidth)).isActive = true
        addButton.controlLabel.text = "Добавить перелет"
        addButton.imageButton.image = UIImage(named: "plus")
        
        backButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backButton)
        backButton.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -5).isActive = true
        backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: CGFloat(controlButtonWidth)).isActive = true
        backButton.controlLabel.text = "Обратный рейс"
        backButton.imageButton.image = UIImage(named: "back")
        
        clearButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(clearButton)
        clearButton.leftAnchor.constraint(equalTo: addButton.rightAnchor, constant: 5).isActive = true
        clearButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: CGFloat(controlButtonWidth)).isActive = true
        clearButton.controlLabel.text = "Очистить параметры"
        clearButton.imageButton.image = UIImage(named: "cross")
        
    }

}
