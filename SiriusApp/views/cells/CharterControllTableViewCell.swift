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
        addButton.widthAnchor.constraint(equalToConstant: 112).isActive = true
        addButton.controlLabel.text = "Добавить перелет"
        
    }

}
