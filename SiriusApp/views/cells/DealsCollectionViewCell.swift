//
//  DealsCollectionViewCell.swift
//  SiriusApp
//
//  Created by Всеволод on 25/11/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class DealsCollectionViewCell: UICollectionViewCell {
    
    var pictureView = UIView()
    
 /*   var pictureView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        backgroundView.frame = CGRect(x: 0, y: 0, width: 340, height: 226)
        backgroundView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        let path = UIBezierPath(roundedRect:backgroundView.bounds,
                                byRoundingCorners:[.topLeft, .bottomRight],
                                cornerRadii: CGSize(width: 10, height:  10))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        backgroundView.layer.mask = maskLayer
        
        var gradientLayer = CAGradientLayer()
        gradientLayer.frame = backgroundView.bounds
        gradientLayer.masksToBounds = false
        gradientLayer.locations = [0.85, 1.0]
        gradientLayer.colors = [#colorLiteral(red: 0.1176470588, green: 0.2784313725, blue: 0.4784313725, alpha: 1) as CGColor, #colorLiteral(red: 0.0862745098, green: 0.3647058824, blue: 0.6, alpha: 1) as CGColor]
        backgroundView.layer.addSublayer(gradientLayer)
        
        let planeImage = UIImageView()
        planeImage.frame = CGRect(x: 0, y: 0, width: 340, height: 166)
        planeImage.clipsToBounds = true
        planeImage.image = UIImage(named: "plane")
        planeImage.contentMode = .scaleAspectFill
        backgroundView.addSubview(planeImage)
        
        return backgroundView
    }()*/
    
    let planePictureView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 28, height: 9.33)
        imageView.image = UIImage(named: "DestPlane")
        return imageView
        
    }()
    
    var coastLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "$ 3 200"
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "17 сентября"
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "14:35"
        return label
    }()
    
    var planePlacesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "9 мест"
        return label
    }()
    
    var planeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Howker 700"
        return label
    }()
    
    var departureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
    
    var destinationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Рига"
        return label
    }()
    
    let separatorLeft: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1, height: 60)
        view.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.62, blue: 0.97, alpha: 0.2)
        return view
    }()
    
    
    let separatorRight: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1, height: 60)
        view.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.62, blue: 0.97, alpha: 0.2)
        return view
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellLayout()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setupCellLayout(){
        self.contentView.addSubview(pictureView)
       
        
        pictureView.backgroundColor = UIColor.white
        pictureView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 226)
        let path = UIBezierPath(roundedRect:pictureView.bounds,
                                byRoundingCorners:[.topLeft, .bottomRight],
                                cornerRadii: CGSize(width: 10, height:  10))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
       pictureView.layer.mask = maskLayer
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = pictureView.bounds
        gradientLayer.masksToBounds = false
        gradientLayer.locations = [0.85, 1.0]
        gradientLayer.colors = [#colorLiteral(red: 0.1176470588, green: 0.2784313725, blue: 0.4784313725, alpha: 1) as CGColor, #colorLiteral(red: 0.0862745098, green: 0.3647058824, blue: 0.6, alpha: 1) as CGColor]
        pictureView.layer.addSublayer(gradientLayer)
        
        let planeImage = UIImageView()
        planeImage.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 166)
        planeImage.clipsToBounds = true
        planeImage.image = UIImage(named: "plane")
        planeImage.contentMode = .scaleAspectFill
        pictureView.addSubview(planeImage)
        
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        pictureView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        pictureView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor).isActive = true
        pictureView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor).isActive = true
        
        
        self.contentView.addSubview(separatorLeft)
        separatorLeft.translatesAutoresizingMaskIntoConstraints = false
        separatorLeft.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        separatorLeft.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: contentView.frame.width/3).isActive = true
        separatorLeft.heightAnchor.constraint(equalToConstant: 60).isActive = true
        separatorLeft.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.contentView.addSubview(separatorRight)
        separatorRight.translatesAutoresizingMaskIntoConstraints = false
        separatorRight.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        separatorRight.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: (contentView.frame.width/3)*2).isActive = true
        separatorRight.heightAnchor.constraint(equalToConstant: 60).isActive = true
        separatorRight.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.contentView.addSubview(coastLabel)
        coastLabel.translatesAutoresizingMaskIntoConstraints = false
        coastLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -18).isActive = true
        coastLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -19).isActive = true
        coastLabel.leftAnchor.constraint(equalTo: separatorRight.rightAnchor, constant: 10).isActive = true
    
        
        self.contentView.addSubview(planeLabel)
        planeLabel.translatesAutoresizingMaskIntoConstraints = false
        planeLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30).isActive = true
        planeLabel.leftAnchor.constraint(equalTo: separatorLeft.rightAnchor, constant: 10).isActive = true
        planeLabel.rightAnchor.constraint(equalTo: separatorRight.leftAnchor, constant: -10).isActive = true
        
        self.contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: separatorLeft.leftAnchor, constant: -10).isActive = true
        
        self.contentView.addSubview(planePlacesLabel)
        planePlacesLabel.translatesAutoresizingMaskIntoConstraints = false
        planePlacesLabel.topAnchor.constraint(equalTo: planeLabel.bottomAnchor, constant: 3).isActive = true
        planePlacesLabel.leftAnchor.constraint(equalTo: planeLabel.leftAnchor).isActive = true
        
        self.contentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 3).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: dateLabel.leftAnchor).isActive = true
        
        self.contentView.addSubview(departureLabel)
        departureLabel.translatesAutoresizingMaskIntoConstraints = false
        departureLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -26).isActive = true
        departureLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        departureLabel.widthAnchor.constraint(lessThanOrEqualToConstant: self.contentView.frame.width/2-29).isActive = true
        
        self.contentView.addSubview(planePictureView)
        planePictureView.translatesAutoresizingMaskIntoConstraints = false
        planePictureView.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -26).isActive = true
        planePictureView.leftAnchor.constraint(equalTo: departureLabel.rightAnchor, constant: 6).isActive = true
        
        self.contentView.addSubview(destinationLabel)
        destinationLabel.translatesAutoresizingMaskIntoConstraints = false
        destinationLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -26).isActive = true
        destinationLabel.leftAnchor.constraint(equalTo:planePictureView.rightAnchor, constant: 6).isActive = true
       destinationLabel.widthAnchor.constraint(lessThanOrEqualToConstant: self.contentView.frame.width/2-29).isActive = true
 
        
       
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
