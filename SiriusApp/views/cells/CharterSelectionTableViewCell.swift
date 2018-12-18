//
//  CharterSelectionTableViewCell.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

protocol CharterSelectionTableViewCellDelegate : class {
    func CharterSelectionTableViewCellDidTapTimeButton(_ sender: CharterSelectionTableViewCell)
    func CharterSelectionTableViewCellDidTapDateButton(_ sender: CharterSelectionTableViewCell)
    func CharterSelectionTableViewCellDidTapPassengerButton(_ sender: CharterSelectionTableViewCell)
    func CharterSelectionTableViewCellDidTapDepartureButton(_ sender: CharterSelectionTableViewCell)
    func CharterSelectionTableViewCellDidTapArivalButton(_ sender: CharterSelectionTableViewCell)
    func CharterSelectionTableViewCellDidTapFlipButton(_ sender: CharterSelectionTableViewCell)
}


class CharterSelectionTableViewCell: UITableViewCell {
    
    let backView = UIView()
    let timeButton = SmallCharterUIButton()
    let dateButton = SmallCharterUIButton()
    let passengerButton = SmallCharterUIButton()
    let departureButton = BigCharterUIButton()
    let arivalButton = BigCharterUIButton()
    let flipButton = UIButton()
    
    let smallButtonWidth = Double(UIScreen.main.bounds.width)/3 - 22.5
    let bigButtonWidth = Double(UIScreen.main.bounds.width)/2 - 33.5
    
    weak var delegate: CharterSelectionTableViewCellDelegate?
    
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
    
    @objc func timeButtonAction(sender: UIButton!) {
        delegate?.CharterSelectionTableViewCellDidTapTimeButton(self)
        
    }
    
    @objc func dateButtonAction(sender: UIButton!) {
        delegate?.CharterSelectionTableViewCellDidTapDateButton(self)
        
    }
    
    @objc func passengerButtonAction(sender: UIButton!) {
        delegate?.CharterSelectionTableViewCellDidTapPassengerButton(self)
        
    }
    
    @objc func departureButtonAction(sender: UIButton!) {
        delegate?.CharterSelectionTableViewCellDidTapDepartureButton(self)
        
    }
    
    @objc func arivalButtonAction(sender: UIButton!) {
        delegate?.CharterSelectionTableViewCellDidTapArivalButton(self)
        
    }
    
    @objc func flipButtonAction(sender: UIButton!) {
        delegate?.CharterSelectionTableViewCellDidTapFlipButton(self)
        
    }
    
    func resetTime(){
        timeButton.smallLabel.text = "Время"
        timeButton.imageButton.tintColor = #colorLiteral(red: 0.003921568627, green: 0.6156862745, blue: 0.968627451, alpha: 1)
        timeButton.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.3607843137, blue: 0.6, alpha: 1)
        timeButton.smallLabel.isUserInteractionEnabled = false
    }
    
    func resetDate(){
        dateButton.smallLabel.text = "Выбрать дату"
        dateButton.imageButton.tintColor = #colorLiteral(red: 0.003921568627, green: 0.6156862745, blue: 0.968627451, alpha: 1)
        dateButton.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.3607843137, blue: 0.6, alpha: 1)
        dateButton.smallLabel.isUserInteractionEnabled = false
    }
    
    func resetPass(){
        passengerButton.smallLabel.text = "Пассажир"
        passengerButton.imageButton.tintColor = #colorLiteral(red: 0.003921568627, green: 0.6156862745, blue: 0.968627451, alpha: 1)
        passengerButton.backgroundColor = #colorLiteral(red: 0.0862745098, green: 0.3607843137, blue: 0.6, alpha: 1)
        passengerButton.smallLabel.isUserInteractionEnabled = false
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
        timeButton.widthAnchor.constraint(equalToConstant: CGFloat(smallButtonWidth)).isActive = true
        timeButton.imageButton.image = UIImage(named: "clocksmall")!.withRenderingMode(.alwaysTemplate)
        timeButton.smallLabel.text = "Время"
        
        timeButton.addTarget(self, action: #selector(timeButtonAction), for: .touchUpInside)
        
        
        
        dateButton.frame = CGRect(x: 0, y: 0, width: smallButtonWidth, height: 53)
        let datePath = UIBezierPath(roundedRect: dateButton.bounds,
                                    byRoundingCorners:[ .topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: 6, height:  6))
        let dateMaskLayer = CAShapeLayer()
        dateMaskLayer.path = datePath.cgPath
        dateButton.layer.mask = dateMaskLayer
        
        dateButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(dateButton)
        dateButton.rightAnchor.constraint(equalTo: timeButton.leftAnchor, constant: -1).isActive = true
        dateButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
        dateButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        dateButton.widthAnchor.constraint(equalToConstant: CGFloat(smallButtonWidth)).isActive = true
        dateButton.imageButton.image = UIImage(named: "calendar")!.withRenderingMode(.alwaysTemplate)
        dateButton.smallLabel.text = "Выбрать дату"
        
       dateButton.addTarget(self, action: #selector(dateButtonAction), for: .touchUpInside)
        

        
        passengerButton.frame = CGRect(x: 0, y: 0, width: smallButtonWidth, height: 53)
        let  passengerPath = UIBezierPath(roundedRect: passengerButton.bounds,
                                          byRoundingCorners:[ .topRight, .bottomRight],
                                          cornerRadii: CGSize(width: 6, height:  6))
        let  passengerMaskLayer = CAShapeLayer()
        passengerMaskLayer.path =  passengerPath.cgPath
        passengerButton.layer.mask =  passengerMaskLayer
        
        passengerButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(passengerButton)
        passengerButton.leftAnchor.constraint(equalTo: timeButton.rightAnchor, constant: 1).isActive = true
        passengerButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
        passengerButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        passengerButton.widthAnchor.constraint(equalToConstant: CGFloat(smallButtonWidth)).isActive = true
        passengerButton.imageButton.image = UIImage(named: "seat")?.withRenderingMode(.alwaysTemplate)
  
        
        passengerButton.smallLabel.text = "Пассажир"
        
        
      passengerButton.addTarget(self, action: #selector(passengerButtonAction), for: .touchUpInside)
        
        departureButton.frame = CGRect(x: 0, y: 0, width: bigButtonWidth, height: 127)
        let  departurePath = UIBezierPath(roundedRect: departureButton.bounds,
                                          byRoundingCorners:[ .topLeft, .bottomLeft],
                                          cornerRadii: CGSize(width: 6, height:  6))
        let  departureMaskLayer = CAShapeLayer()
        departureMaskLayer.path =  departurePath.cgPath
        departureButton.layer.mask =  departureMaskLayer
        
        departureButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(departureButton)
        departureButton.leftAnchor.constraint(equalTo: dateButton.leftAnchor, constant: 0).isActive = true
        departureButton.bottomAnchor.constraint(equalTo: dateButton.topAnchor, constant: -1).isActive = true
        departureButton.heightAnchor.constraint(equalToConstant: 127).isActive = true
        departureButton.widthAnchor.constraint(equalToConstant: CGFloat(bigButtonWidth)).isActive = true
        departureButton.bigLabel.text = "Откуда"
        departureButton.buttonSide = .left
        departureButton.addTarget(self, action: #selector(departureButtonAction), for: .touchUpInside)
        
        
        
        arivalButton.frame = CGRect(x: 0, y: 0, width: bigButtonWidth, height: 127)
        let  arivalPath = UIBezierPath(roundedRect: arivalButton.bounds,
                                       byRoundingCorners:[ .topRight, .bottomRight],
                                       cornerRadii: CGSize(width: 6, height:  6))
        let  arivalMaskLayer = CAShapeLayer()
        arivalMaskLayer.path =  arivalPath.cgPath
        arivalButton.layer.mask =  arivalMaskLayer
        
        arivalButton.translatesAutoresizingMaskIntoConstraints = false
        self.backView.addSubview(arivalButton)
        arivalButton.rightAnchor.constraint(equalTo: passengerButton.rightAnchor, constant: 0).isActive = true
        arivalButton.bottomAnchor.constraint(equalTo: passengerButton.topAnchor, constant: -1).isActive = true
        arivalButton.heightAnchor.constraint(equalToConstant: 127).isActive = true
        arivalButton.widthAnchor.constraint(equalToConstant: CGFloat(bigButtonWidth)).isActive = true
        arivalButton.bigLabel.text = "Куда"
        arivalButton.buttonSide = .right
        arivalButton.addTarget(self, action: #selector(arivalButtonAction), for: .touchUpInside)
        
        
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        flipButton.setImage(UIImage(named: "flip"), for: .normal)
        flipButton.backgroundColor = .clear
        self.backView.addSubview(flipButton)
        flipButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        flipButton.widthAnchor.constraint(equalToConstant: 72).isActive = true
        flipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        flipButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 40).isActive = true
        
        flipButton.addTarget(self, action: #selector(flipButtonAction), for: .touchUpInside)
        
        
        
    }
    
    
}
