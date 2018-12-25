//
//  NotificationTableViewCell.swift
//  SiriusApp
//
//  Created by Всеволод on 23/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

protocol NotificationTableViewCellDelegate : class {
    func NotificationTableViewCellDidTapMoreButton(_ sender: NotificationTableViewCell)
    func NotificationTableViewCellDidTapDealButton(_ sender: NotificationTableViewCell)
}

class NotificationTableViewCell: UITableViewCell {
    
    var indexPath = IndexPath(row: 0, section: 0)
    
    weak var delegate: NotificationTableViewCellDelegate?
    
    var avatarImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Ellipse")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "12.15.18"
        return label
    }()
    
    var shortTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "5 января, Hawker 750 VQ-BBQ, $2750"
        return label
    }()
    
    var longTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Основное тело сообщения. Парк воздушных судов Sirius Aero – это современные иностранные бизнес джеты и российские бизнес лайнеры с премиальной конфигурацией салона."
        return label
    }()
    
    var dealButton: UIButton = {
        let button = UIButton()
        button.setTitle("Рига-Москва", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font =  .systemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .left
        button.isEnabled = true
        return button
    }()
    
    var showMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Показать полностью...", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font =  .systemFont(ofSize: 14)
        button.isEnabled = true
        return button
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
    
    @objc func moreButtonAction(sender: UIButton!) {
        delegate?.NotificationTableViewCellDidTapMoreButton(self)
    }
    
    @objc func dealButtonAction(sender: UIButton!) {
        delegate?.NotificationTableViewCellDidTapDealButton(self)
    }
    
    func setupLayout(){
        
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.contentView.addSubview(avatarImage)
        avatarImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        avatarImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 10).isActive = true
        
        dealButton.translatesAutoresizingMaskIntoConstraints = false
        dealButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.contentView.addSubview(dealButton)
        dealButton.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        dealButton.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 5).isActive = true
        dealButton.widthAnchor.constraint(equalToConstant: 200)
        dealButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        dealButton.addTarget(self, action: #selector(dealButtonAction), for: .touchUpInside)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(dateLabel)
        dateLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
        shortTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(shortTextLabel)
        shortTextLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        shortTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        shortTextLabel.rightAnchor.constraint(equalTo: dateLabel.leftAnchor, constant: -10).isActive = true
        
        longTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(longTextLabel)
        longTextLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        longTextLabel.topAnchor.constraint(equalTo: shortTextLabel.bottomAnchor, constant: 15).isActive = true
        longTextLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(showMoreButton)
        showMoreButton.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        showMoreButton.topAnchor.constraint(equalTo: longTextLabel.bottomAnchor, constant: 5).isActive = true
        showMoreButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        showMoreButton.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
