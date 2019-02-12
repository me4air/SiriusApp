//
//  FilterViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 05/02/2019.
//  Copyright © 2019 me4air. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController  {
    
    let scrollView : UIScrollView = {
        let view = UIScrollView()
        view.contentSize.height = 650
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.08343778185, green: 0.1907790372, blue: 0.3322438157, alpha: 1)
        return view
    }()
    
    var departureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Направления перелетов"
        return label
    }()
    
    var perioudLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Период"
        return label
    }()
    
    var costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Стоимость"
        return label
    }()
    
    var costDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = #colorLiteral(red: 0.9878239879, green: 0.9674323089, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "До $ 1000"
        return label
    }()
    
    let okButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ок", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1), for: .normal)
        return button
    }()
    
    let blockView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        return view
    }()
    
    let blockViewSecond: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.backgroundColor = #colorLiteral(red: 0.08343778185, green: 0.1907790372, blue: 0.3322438157, alpha: 1)
        return view
    }()
    
    let blockViewTherd: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.backgroundColor = #colorLiteral(red: 0.08343778185, green: 0.1907790372, blue: 0.3322438157, alpha: 1)
        return view
    }()
    
    let startDateButton = SmallCharterUIButton()
    let endDateButton = SmallCharterUIButton()
    let dateButtonWidth = UIScreen.main.bounds.width/2 - 36
    
    let coastSlider = UISlider()
    
    var datePicker = UIDatePicker()
    
    let allRadioButton = RadioUIButton()
    let flyghtsRadioButton = RadioUIButton()
    
  //  let departureSwitch = UISwitch()
    let periodSwitch = UISwitch()
    let costSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Фильтр"
        self.navigationItem.largeTitleDisplayMode = .never
        self.hideKeyboardWhenTappedAround()
        self.view.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    @objc func sliderVaueChanged(sender: UISlider!) {
        
        if !costSwitch.isOn{
            costSwitch.isOn = true
            blockViewTherd.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        }
        
        print(sender.value)
        costDetailLabel.text = "До $ " + String(Int(sender.value))
    }
    
    @objc func dateButtonAction(sender: UIButton!) {
        
        if !periodSwitch.isOn{
            periodSwitch.isOn = true
            blockViewSecond.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        }
        
        print("HI")
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        if let button = sender as? SmallCharterUIButton {
            button.smallLabel.isUserInteractionEnabled = true
            button.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
            button.smallLabel.tintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
            datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
            datePicker.locale = NSLocale.init(localeIdentifier: "ru") as Locale
            datePicker.minimumDate = Date()
            datePicker.maximumDate = Date().addingTimeInterval(60 * 60 * 24 * 360 * 5)
            button.smallLabel.inputView = datePicker
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd.MM.yy"
            button.smallLabel.text = dateformatter.string(from: (datePicker.date))
            datePicker.addTarget(self, action: #selector(datePickerValueChanged(picker:)), for: .valueChanged)
            button.imageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button.smallLabel.inputAccessoryView = toolbar
            datePicker.tag = sender.tag
            button.smallLabel.becomeFirstResponder()
        }
        
    }
    
    @objc func datePickerValueChanged(picker : UIDatePicker){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd.MM.yy"
        let result = dateformatter.string(from: (datePicker.date))
        if picker.tag == 0 {
            startDateButton.smallLabel.text = result
        } else {
            endDateButton.smallLabel.text = result
        }
    }
    
    @objc func doneButtonAction(sender: UIButton!) {
        self.view.endEditing(true)
    }
    
    @objc func okAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func radioButtonAction(sender: UIButton!) {
        if let button = sender as? RadioUIButton {
            if !button.isChecked {
                allRadioButton.changeState()
                flyghtsRadioButton.changeState()
            }
        }
    }
    
    
    @objc func SwitchVaueChanged(sender: UISwitch!) {
        switch sender.isOn {
        case true:
            if sender.tag == 0 {
                blockViewSecond.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
  
            } else {
                blockViewTherd.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
                coastSlider.isEnabled = true
            }
        case false:
            if sender.tag == 0 {
                blockViewSecond.backgroundColor = #colorLiteral(red: 0.08343778185, green: 0.1907790372, blue: 0.3322438157, alpha: 1)
            } else {
                blockViewTherd.backgroundColor = #colorLiteral(red: 0.08343778185, green: 0.1907790372, blue: 0.3322438157, alpha: 1)
            }
     
        }
    }
    
    func setupLayout(){
        
        self.view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        blockView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(blockView)
        blockView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        blockView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        blockView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        blockView.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        departureLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(departureLabel)
        departureLabel.topAnchor.constraint(equalTo: blockView.topAnchor, constant: 20).isActive = true
        departureLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 35).isActive = true
        
      /*  departureSwitch.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(departureSwitch)
        departureSwitch.topAnchor.constraint(equalTo: departureLabel.topAnchor).isActive = true
        departureSwitch.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -35).isActive = true
        departureSwitch.onTintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        departureSwitch.tintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        departureSwitch.thumbTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        departureSwitch.isOn = false */
        
        allRadioButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(allRadioButton)
        allRadioButton.leftAnchor.constraint(equalTo: departureLabel.leftAnchor).isActive = true
        allRadioButton.topAnchor.constraint(equalTo: departureLabel.bottomAnchor, constant: 30).isActive = true
        allRadioButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        allRadioButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        allRadioButton.smallLabel.text = "Все"
        allRadioButton.setInitial(state: true)
        allRadioButton.addTarget(self, action: #selector(radioButtonAction), for: .touchUpInside)
        
        flyghtsRadioButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(flyghtsRadioButton)
        flyghtsRadioButton.leftAnchor.constraint(equalTo: departureLabel.leftAnchor).isActive = true
        flyghtsRadioButton.topAnchor.constraint(equalTo: allRadioButton.bottomAnchor, constant: 20).isActive = true
        flyghtsRadioButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        flyghtsRadioButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        flyghtsRadioButton.smallLabel.text = "Из моих направлений"
        flyghtsRadioButton.setInitial(state: false)
        flyghtsRadioButton.addTarget(self, action: #selector(radioButtonAction), for: .touchUpInside)
        
        blockViewSecond.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(blockViewSecond)
        blockViewSecond.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        blockViewSecond.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        blockViewSecond.topAnchor.constraint(equalTo: blockView.bottomAnchor, constant: 10).isActive = true
        blockViewSecond.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        perioudLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(perioudLabel)
        perioudLabel.topAnchor.constraint(equalTo: blockViewSecond.topAnchor, constant: 20).isActive = true
        perioudLabel.leftAnchor.constraint(equalTo: departureLabel.leftAnchor).isActive = true
        
        
        periodSwitch.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(periodSwitch)
        periodSwitch.topAnchor.constraint(equalTo: perioudLabel.topAnchor).isActive = true
        periodSwitch.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -35).isActive = true
        periodSwitch.onTintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        periodSwitch.tintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        periodSwitch.thumbTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        periodSwitch.isOn = false
        periodSwitch.tag = 0
        periodSwitch.addTarget(self, action: #selector(SwitchVaueChanged), for: .valueChanged)
        
        startDateButton.frame = CGRect(x: 0, y: 0, width: dateButtonWidth, height: 53)
        let datePath = UIBezierPath(roundedRect: startDateButton.bounds,
                                    byRoundingCorners:[ .topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: 6, height:  6))
        let dateMaskLayer = CAShapeLayer()
        dateMaskLayer.path = datePath.cgPath
        startDateButton.layer.mask = dateMaskLayer
        
        startDateButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(startDateButton)
        startDateButton.leftAnchor.constraint(equalTo: perioudLabel.leftAnchor, constant: 0).isActive = true
        startDateButton.topAnchor.constraint(equalTo: perioudLabel.bottomAnchor, constant: 35).isActive = true
        startDateButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        startDateButton.widthAnchor.constraint(equalToConstant: CGFloat(dateButtonWidth)).isActive = true
        startDateButton.imageButton.image = UIImage(named: "calendar")!.withRenderingMode(.alwaysTemplate)
        startDateButton.smallLabel.text = "Выбрать дату"
      //  startDateButton.isEnabled = false
        
        endDateButton.tag = 0
        startDateButton.addTarget(self, action: #selector(dateButtonAction), for: .touchUpInside)
        
        endDateButton.frame = CGRect(x: 0, y: 0, width: dateButtonWidth, height: 53)
        let dateEndPath = UIBezierPath(roundedRect: endDateButton.bounds,
                                       byRoundingCorners:[ .topRight, .bottomRight],
                                       cornerRadii: CGSize(width: 6, height:  6))
        let dateEndMaskLayer = CAShapeLayer()
        dateEndMaskLayer.path = dateEndPath.cgPath
        endDateButton.layer.mask = dateEndMaskLayer
        
        endDateButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(endDateButton)
        endDateButton.topAnchor.constraint(equalTo: perioudLabel.bottomAnchor, constant: 35).isActive = true
        endDateButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -35).isActive = true
        endDateButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        endDateButton.widthAnchor.constraint(equalToConstant: CGFloat(dateButtonWidth)).isActive = true
        endDateButton.imageButton.image = UIImage(named: "calendar")!.withRenderingMode(.alwaysTemplate)
        endDateButton.smallLabel.text = "Выбрать дату"
        endDateButton.tag = 1
        endDateButton.addTarget(self, action: #selector(dateButtonAction), for: .touchUpInside)
       // endDateButton.isEnabled = false
        
        blockViewTherd.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(blockViewTherd)
        blockViewTherd.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        blockViewTherd.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        blockViewTherd.topAnchor.constraint(equalTo: blockViewSecond.bottomAnchor, constant: 10).isActive = true
        blockViewTherd.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(costLabel)
        costLabel.topAnchor.constraint(equalTo: blockViewTherd.topAnchor, constant: 20).isActive = true
        costLabel.leftAnchor.constraint(equalTo: perioudLabel.leftAnchor).isActive = true
        
        costDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(costDetailLabel)
        costDetailLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 15).isActive = true
        costDetailLabel.leftAnchor.constraint(equalTo: perioudLabel.leftAnchor).isActive = true
        
        coastSlider.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(coastSlider)
        coastSlider.leftAnchor.constraint(equalTo: perioudLabel.leftAnchor).isActive = true
        coastSlider.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -35).isActive = true
        coastSlider.topAnchor.constraint(equalTo: costDetailLabel.bottomAnchor, constant: 7).isActive = true
        coastSlider.minimumValue = 500
        coastSlider.maximumValue = 5000
        coastSlider.setValue(5000, animated: false)
        coastSlider.tintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
       // coastSlider.isEnabled = false
        coastSlider.addTarget(self, action: #selector(sliderVaueChanged), for: .valueChanged)
        
        costSwitch.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(costSwitch)
        costSwitch.topAnchor.constraint(equalTo: costLabel.topAnchor).isActive = true
        costSwitch.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -35).isActive = true
        costSwitch.onTintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        costSwitch.tintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        costSwitch.thumbTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        costSwitch.isOn = false
        costSwitch.tag = 1
        costSwitch.addTarget(self, action: #selector(SwitchVaueChanged), for: .valueChanged)
        
        okButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        okButton.layer.cornerRadius = 25
        view.addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        okButton.topAnchor.constraint(equalTo: blockViewTherd.bottomAnchor, constant: 20).isActive = true
        okButton.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        okButton.addTarget(self, action: #selector(okAction), for: .touchUpInside)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
