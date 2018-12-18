//
//  airportSearchTableViewCell.swift
//  SiriusApp
//
//  Created by Всеволод on 16/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class airportSearchTableViewCell: UITableViewCell {
    
    var airportNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Аэропорт Домодедово"
        return label
    }()
    
    var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Москва"
        return label
    }()
    
    var cityCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
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
    self.contentView.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.1960784314, blue: 0.3647058824, alpha: 1)
        
    cityCodeLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(cityCodeLabel)
    cityCodeLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
    cityCodeLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        
    airportNameLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(airportNameLabel)
    airportNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
    airportNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        
    cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(cityNameLabel)
    cityNameLabel.leftAnchor.constraint(equalTo: airportNameLabel.leftAnchor).isActive = true
    cityNameLabel.topAnchor.constraint(equalTo: airportNameLabel.bottomAnchor, constant: 3).isActive = true
        
        
    }

}
