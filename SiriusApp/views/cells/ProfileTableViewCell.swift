//
//  ProfileTableViewCell.swift
//  SiriusApp
//
//  Created by Всеволод on 23/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    var arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrowmenu")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var menuImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "exit")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var menuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Deals:"
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLayout(){
        
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(menuImage)
        menuImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        menuImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
        menuImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        menuImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(arrowImage)
        arrowImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        arrowImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -25).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 7.4).isActive = true
        arrowImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(menuLabel)
        menuLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        menuLabel.leftAnchor.constraint(equalTo: menuImage.rightAnchor, constant: 10).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
