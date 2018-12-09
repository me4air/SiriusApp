//
//  SelectedDealViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 02/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class SelectedDealViewController: UIViewController {
    
    let scrollView : UIScrollView = {
        let view = UIScrollView()
        view.contentSize.height = 933-55
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    let sliderView = UIView()
    
    let imageSeparator = UIImageView()
    
    let clockImage = UIImageView()
    
    
    
    let leftBorderView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 6, height: 51)
        let borderShape  = CAShapeLayer()
        let borderpath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 6, height: 51), byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 6, height:  6))
        borderShape.path = borderpath.cgPath
        borderShape.fillColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        view.layer.addSublayer(borderShape)
        return view
    }()
    
    let rightBorderView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 6, height: 51)
        let borderShape  = CAShapeLayer()
        let borderpath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 6, height: 51), byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 6, height:  6))
        borderShape.path = borderpath.cgPath
        borderShape.fillColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        view.layer.addSublayer(borderShape)
        return view
    }()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.22, blue: 0.38, alpha: 0.2)
        return view
    }()
    
    let infoBlockFirst: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.98, blue: 1.0, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let infoBlockSecond: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.98, blue: 1.0, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let infoBlockButton: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.98, blue: 1.0, alpha: 1.0)
        view.clipsToBounds = true
        return view
    }()
    
    var departureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .regular)
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
    
    var departureLabelDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
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
    
    var departureTimeLabel: UILabel = {
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
        label.text = "09:15"
        return label
    }()
    
    var destinationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "RIX"
        return label
    }()
    
    var destinationLabelDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .right
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Рига"
        return label
    }()
    
    var arivalTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .right
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "18:29"
        return label
    }()
    
    var inFlyghtTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "время полета 35 минут"
        return label
    }()
    
    var departureDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "17 сентября Вторник"
        return label
    }()
    
    var arivalDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .right
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "17 сентября Вторник"
        return label
    }()
    
    var planeName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Legacy 600 VP-BGT"
        return label
    }()
    
    var classStaticLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Класс"
        return label
    }()
    
    var numPassengersStaticLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Макс. число пассажиров"
        return label
    }()
    
    var bagadgeStaticLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Объем багажного отделения"
        return label
    }()
    
    var distanceStaticLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Дальность перелета"
        return label
    }()
    
    
    var classLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Super Jets"
        return label
    }()
    
    var numPassengersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "192"
        return label
    }()
    
    var bagadgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "12,4 m3"
        return label
    }()
    
    var distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "6800 km"
        return label
    }()
    
    
    var coastLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "$ 3 200"
        return label
    }()
    
    
    let byButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заказать рейс", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "О перелете"
        self.navigationItem.largeTitleDisplayMode = .never
        //self.tabBarController?.tabBar.isHidden = false
        setupScrollView()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        let svc = RequestViewController()
        navigationController?.pushViewController(svc, animated: true)
    }
    
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
       // scrollView.delegate = self
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 90)
        gradientLayer.masksToBounds = false
        gradientLayer.locations = [1,0]
        gradientLayer.colors = [
            UIColor(red: 0, green: 0.41, blue: 0.67, alpha: 1).cgColor,
            UIColor(red: 0.1, green: 0.22, blue: 0.38, alpha: 1).cgColor
        ]
        scrollView.layer.addSublayer(gradientLayer)
        
        sliderView.frame = CGRect(x: 0, y: 0, width: view.frame.width-30, height: 200)
        let path = UIBezierPath(roundedRect:sliderView.bounds,
                                byRoundingCorners:[ .topLeft, .bottomRight],
                                cornerRadii: CGSize(width: 10, height:  10))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        sliderView.layer.mask = maskLayer
        sliderView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        scrollView.addSubview(sliderView)
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        sliderView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        sliderView.widthAnchor.constraint(equalToConstant: self.view.frame.width-30).isActive = true
        sliderView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        
        scrollView.addSubview(leftBorderView)
        leftBorderView.translatesAutoresizingMaskIntoConstraints = false
        leftBorderView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        leftBorderView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 248).isActive = true
        
        scrollView.addSubview(rightBorderView)
        rightBorderView.translatesAutoresizingMaskIntoConstraints = false
        rightBorderView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: self.view.frame.width-6).isActive = true
        rightBorderView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 248).isActive = true
        
        scrollView.addSubview(departureLabel)
        departureLabel.translatesAutoresizingMaskIntoConstraints = false
        departureLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 245).isActive = true
        departureLabel.leftAnchor.constraint(equalTo: leftBorderView.rightAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(departureLabelDetail)
        departureLabelDetail.translatesAutoresizingMaskIntoConstraints = false
        departureLabelDetail.topAnchor.constraint(equalTo: departureLabel.bottomAnchor).isActive = true
        departureLabelDetail.leftAnchor.constraint(equalTo: departureLabel.leftAnchor).isActive = true
        departureLabelDetail.widthAnchor.constraint(equalToConstant: 85).isActive = true
        
        scrollView.addSubview(destinationLabel)
        destinationLabel.translatesAutoresizingMaskIntoConstraints = false
        destinationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 245).isActive = true
        destinationLabel.rightAnchor.constraint(equalTo: rightBorderView.leftAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(destinationLabelDetail)
        destinationLabelDetail.translatesAutoresizingMaskIntoConstraints = false
        destinationLabelDetail.topAnchor.constraint(equalTo: destinationLabel.bottomAnchor).isActive = true
        destinationLabelDetail.rightAnchor.constraint(equalTo: destinationLabel.rightAnchor).isActive = true
        destinationLabelDetail.widthAnchor.constraint(equalToConstant: 85).isActive = true
        
        imageSeparator.translatesAutoresizingMaskIntoConstraints = false
        imageSeparator.frame = CGRect(x: 0, y: 0, width: view.frame.width-214, height: 37)
        imageSeparator.clipsToBounds = true
        imageSeparator.contentMode = .scaleAspectFill
        imageSeparator.image = UIImage(named: "airplane")
        scrollView.addSubview(imageSeparator)
        imageSeparator.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        imageSeparator.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 257).isActive = true
        
        scrollView.addSubview(departureTimeLabel)
        departureTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        departureTimeLabel.leftAnchor.constraint(equalTo: departureLabelDetail.leftAnchor).isActive = true
        departureTimeLabel.topAnchor.constraint(equalTo: departureLabelDetail.bottomAnchor, constant: 22).isActive = true
        
        scrollView.addSubview(arivalTimeLabel)
        arivalTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        arivalTimeLabel.rightAnchor.constraint(equalTo: destinationLabelDetail.rightAnchor).isActive = true
        arivalTimeLabel.topAnchor.constraint(equalTo: destinationLabelDetail.bottomAnchor, constant: 22).isActive = true
        
        clockImage.translatesAutoresizingMaskIntoConstraints = false
        clockImage.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        clockImage.clipsToBounds = true
        clockImage.contentMode = .scaleAspectFill
        clockImage.image = UIImage(named: "clock")
        scrollView.addSubview(clockImage)
        clockImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        clockImage.topAnchor.constraint(equalTo: departureLabelDetail.bottomAnchor, constant: 20).isActive = true
        
        scrollView.addSubview(inFlyghtTimeLabel)
        inFlyghtTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        inFlyghtTimeLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        inFlyghtTimeLabel.widthAnchor.constraint(equalToConstant: 81).isActive = true
        inFlyghtTimeLabel.topAnchor.constraint(equalTo: clockImage.bottomAnchor, constant: 7).isActive = true
        
        scrollView.addSubview(departureDateLabel)
        departureDateLabel.translatesAutoresizingMaskIntoConstraints = false
        departureDateLabel.leftAnchor.constraint(equalTo: departureTimeLabel.leftAnchor).isActive = true
        departureDateLabel.widthAnchor.constraint(equalToConstant: 81).isActive = true
        departureDateLabel.topAnchor.constraint(equalTo: departureTimeLabel.bottomAnchor, constant: 7).isActive = true
        
        scrollView.addSubview(arivalDateLabel)
        arivalDateLabel.translatesAutoresizingMaskIntoConstraints = false
        arivalDateLabel.rightAnchor.constraint(equalTo: arivalTimeLabel.rightAnchor).isActive = true
        arivalDateLabel.widthAnchor.constraint(equalToConstant: 81).isActive = true
        arivalDateLabel.topAnchor.constraint(equalTo: arivalTimeLabel.bottomAnchor, constant: 7).isActive = true
        
        
        scrollView.addSubview(separatorLine)
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        separatorLine.widthAnchor.constraint(equalToConstant: view.frame.width-32).isActive = true
        separatorLine.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 396).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.addSubview(planeName)
        planeName.translatesAutoresizingMaskIntoConstraints = false
        planeName.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        planeName.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 25).isActive = true
        
        scrollView.addSubview(infoBlockFirst)
        infoBlockFirst.translatesAutoresizingMaskIntoConstraints = false
        infoBlockFirst.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        infoBlockFirst.widthAnchor.constraint(equalToConstant: view.frame.width-32).isActive = true
        infoBlockFirst.topAnchor.constraint(equalTo: planeName.bottomAnchor, constant: 11).isActive = true
        infoBlockFirst.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(infoBlockSecond)
        infoBlockSecond.translatesAutoresizingMaskIntoConstraints = false
        infoBlockSecond.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        infoBlockSecond.widthAnchor.constraint(equalToConstant: view.frame.width-32).isActive = true
        infoBlockSecond.topAnchor.constraint(equalTo: infoBlockFirst.bottomAnchor, constant: 52).isActive = true
        infoBlockSecond.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(infoBlockButton)
        infoBlockButton.translatesAutoresizingMaskIntoConstraints = false
        infoBlockButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        infoBlockButton.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        infoBlockButton.topAnchor.constraint(equalTo: infoBlockSecond.bottomAnchor, constant: 74).isActive = true
        infoBlockButton.heightAnchor.constraint(equalToConstant: 210).isActive = true
        
        scrollView.addSubview(classStaticLabel)
        classStaticLabel.translatesAutoresizingMaskIntoConstraints = false
        classStaticLabel.leftAnchor.constraint(equalTo: infoBlockFirst.leftAnchor, constant: 21).isActive = true
        classStaticLabel.topAnchor.constraint(equalTo: infoBlockFirst.topAnchor, constant: 16).isActive = true
        classStaticLabel.widthAnchor.constraint(equalToConstant: 202).isActive = true
        
        scrollView.addSubview(bagadgeStaticLabel)
        bagadgeStaticLabel.translatesAutoresizingMaskIntoConstraints = false
        bagadgeStaticLabel.leftAnchor.constraint(equalTo: infoBlockSecond.leftAnchor, constant: 21).isActive = true
        bagadgeStaticLabel.topAnchor.constraint(equalTo: infoBlockSecond.topAnchor, constant: 6).isActive = true
        bagadgeStaticLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(numPassengersStaticLabel)
        numPassengersStaticLabel.translatesAutoresizingMaskIntoConstraints = false
        numPassengersStaticLabel.leftAnchor.constraint(equalTo: infoBlockFirst.leftAnchor, constant: 21).isActive = true
        numPassengersStaticLabel.topAnchor.constraint(equalTo: infoBlockFirst.bottomAnchor, constant: 16).isActive = true
        numPassengersStaticLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        scrollView.addSubview(distanceStaticLabel)
        distanceStaticLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceStaticLabel.leftAnchor.constraint(equalTo: infoBlockFirst.leftAnchor, constant: 21).isActive = true
        distanceStaticLabel.topAnchor.constraint(equalTo: infoBlockSecond.bottomAnchor, constant: 16).isActive = true
        distanceStaticLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        scrollView.addSubview(coastLabel)
        coastLabel.translatesAutoresizingMaskIntoConstraints = false
        coastLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        coastLabel.topAnchor.constraint(equalTo: infoBlockButton.topAnchor, constant: 25).isActive = true
        coastLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width-20).isActive = true
        
        scrollView.addSubview(classLabel)
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        classLabel.leftAnchor.constraint(equalTo: infoBlockFirst.leftAnchor, constant: 230).isActive = true
        classLabel.rightAnchor.constraint(equalTo: infoBlockFirst.rightAnchor, constant: 10).isActive = true
        classLabel.topAnchor.constraint(equalTo: infoBlockFirst.topAnchor, constant: 17).isActive = true
        
        scrollView.addSubview(bagadgeLabel)
        bagadgeLabel.translatesAutoresizingMaskIntoConstraints = false
        bagadgeLabel.leftAnchor.constraint(equalTo: infoBlockSecond.leftAnchor, constant: 230).isActive = true
        bagadgeLabel.rightAnchor.constraint(equalTo: infoBlockSecond.rightAnchor, constant: 10).isActive = true
        bagadgeLabel.topAnchor.constraint(equalTo: infoBlockSecond.topAnchor, constant: 17).isActive = true
        
        scrollView.addSubview(numPassengersLabel)
        numPassengersLabel.translatesAutoresizingMaskIntoConstraints = false
        numPassengersLabel.leftAnchor.constraint(equalTo: infoBlockFirst.leftAnchor, constant: 230).isActive = true
        numPassengersLabel.rightAnchor.constraint(equalTo: infoBlockFirst.rightAnchor, constant: 10).isActive = true
        numPassengersLabel.topAnchor.constraint(equalTo: infoBlockFirst.bottomAnchor, constant: 17).isActive = true
        
        scrollView.addSubview(distanceLabel)
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.leftAnchor.constraint(equalTo: infoBlockSecond.leftAnchor, constant: 230).isActive = true
        distanceLabel.rightAnchor.constraint(equalTo: infoBlockSecond.rightAnchor, constant: 10).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: infoBlockSecond.bottomAnchor, constant: 17).isActive = true
        
        byButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        byButton.layer.cornerRadius = 25
        scrollView.addSubview(byButton)
        byButton.translatesAutoresizingMaskIntoConstraints = false
        byButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        byButton.topAnchor.constraint(equalTo: coastLabel.bottomAnchor, constant: 20).isActive = true
        byButton.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        byButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        byButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        
    }
    
    
}