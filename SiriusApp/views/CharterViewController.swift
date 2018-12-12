//
//  CharterViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 23/11/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class CharterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource, CharterControllTableViewCellDelegate, CharterSelectionTableViewCellDelegate {
 
  
    
    let charterTableView = UITableView()
    
    var datePicker: UIDatePicker?
    
    var passPicker = UIPickerView()
    
   let pickerSetas = ["1","2","3","4","5","6","7","8"]

    let requestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заказать", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        charterTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        charterTableView.dataSource = self
        charterTableView.delegate = self
        charterTableView.allowsSelection = false
        charterTableView.separatorStyle = .none
        charterTableView.register(CharterSelectionTableViewCell.self, forCellReuseIdentifier: "cell")
        charterTableView.register(CharterControllTableViewCell.self, forCellReuseIdentifier: "control")
        setuplayout()
        let tapGestRexogonizer = UITapGestureRecognizer(target: self, action: #selector(didTapedTableView))
        charterTableView.addGestureRecognizer(tapGestRexogonizer)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapedTableView(){
    view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2 }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = charterTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharterSelectionTableViewCell
            cell.delegate = self
            cell.tag = indexPath.row
            return cell
            
        }
        else {
            let cell = charterTableView.dequeueReusableCell(withIdentifier: "control", for: indexPath) as! CharterControllTableViewCell
            cell.delegate = self
            return cell
        }
        
    }
    
    func releseDatePickerView(sender :CharterSelectionTableViewCell, type : String) -> String{
        var result = ""
        
        
        switch type {
        case "Date":
            datePicker = UIDatePicker()
            datePicker?.datePickerMode = .date
            datePicker!.locale = NSLocale.init(localeIdentifier: "ru") as Locale
            datePicker?.minimumDate = Date()
            datePicker?.maximumDate = Date().addingTimeInterval(60 * 60 * 24 * 180)
            sender.dateButton.smallLabel.inputView = datePicker
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd.MM.yy"
            result = dateformatter.string(from: (datePicker?.date)!)
            datePicker?.tag = sender.tag
            datePicker?.addTarget(self, action: #selector(datePickerValueChanged(picker:)), for: .valueChanged)
            return result
            
        case "Time":
            datePicker = UIDatePicker()
            datePicker?.datePickerMode = .time
            sender.timeButton.smallLabel.inputView = datePicker
            let timeFormater = DateFormatter()
            timeFormater.dateFormat = "HH:mm"
            result = timeFormater.string(from: (datePicker?.date)!)
            datePicker?.tag = sender.tag
            datePicker?.addTarget(self, action: #selector(timePickerValueChanged(picker:)), for: .valueChanged)
            return result
            
        case "Pass":
            passPicker.delegate = self
            passPicker.tag = sender.tag
            sender.passengerButton.smallLabel.inputView = passPicker
            result = String(passPicker.selectedRow(inComponent: 0)+1)
            return result
            

        default:
            return result
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return pickerSetas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return pickerSetas[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let indexPath = IndexPath(row: (pickerView.tag), section: 0)
        let cell = self.charterTableView.cellForRow(at: indexPath) as! CharterSelectionTableViewCell
        cell.passengerButton.smallLabel.text = pickerSetas[row]
    }
    
    
    
    
    
    @objc func datePickerValueChanged(picker : UIDatePicker){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd.MM.yy"
        let result = dateformatter.string(from: (datePicker?.date)!)
        let indexPath = IndexPath(row: (datePicker?.tag)!, section: 0)
        let cell = self.charterTableView.cellForRow(at: indexPath) as! CharterSelectionTableViewCell
        cell.dateButton.smallLabel.text = result
    }
    
    @objc func timePickerValueChanged(picker : UIDatePicker){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm"
        let result = dateformatter.string(from: (datePicker?.date)!)
        let indexPath = IndexPath(row: (datePicker?.tag)!, section: 0)
        let cell = self.charterTableView.cellForRow(at: indexPath) as! CharterSelectionTableViewCell
        cell.timeButton.smallLabel.text = result
    }
    
    //SELECTION
    
    func CharterSelectionTableViewCellDidTapTimeButton(_ sender: CharterSelectionTableViewCell) {
        print("Time taped")
        sender.timeButton.smallLabel.isUserInteractionEnabled = true
        sender.timeButton.backgroundColor = #colorLiteral(red: 0.1013741792, green: 0.4475174716, blue: 0.7449278236, alpha: 1)
        sender.timeButton.smallLabel.text = releseDatePickerView(sender: sender, type: "Time")
        sender.timeButton.smallLabel.becomeFirstResponder()
        
    }
    
    func CharterSelectionTableViewCellDidTapDateButton(_ sender: CharterSelectionTableViewCell) {
        print("Date taped")
        sender.dateButton.smallLabel.isUserInteractionEnabled = true
        sender.dateButton.backgroundColor = #colorLiteral(red: 0.1013741792, green: 0.4475174716, blue: 0.7449278236, alpha: 1)
        sender.dateButton.smallLabel.text = releseDatePickerView(sender: sender, type: "Date")
        sender.dateButton.smallLabel.becomeFirstResponder()
    }
    
    func CharterSelectionTableViewCellDidTapPassengerButton(_ sender: CharterSelectionTableViewCell) {
        print("Pass taped")
        sender.passengerButton.smallLabel.isUserInteractionEnabled = true
        sender.passengerButton.backgroundColor = #colorLiteral(red: 0.1013741792, green: 0.4475174716, blue: 0.7449278236, alpha: 1)
        sender.passengerButton.smallLabel.text = releseDatePickerView(sender: sender, type: "Pass")
        sender.passengerButton.smallLabel.becomeFirstResponder()
    }
    
    func CharterSelectionTableViewCellDidTapDepartureButton(_ sender: CharterSelectionTableViewCell) {
        print("Dep taped")
    }
    
    func CharterSelectionTableViewCellDidTapArivalButton(_ sender: CharterSelectionTableViewCell) {
        print("Ariv taped")
    }
    
    func CharterSelectionTableViewCellDidTapFlipButton(_ sender: CharterSelectionTableViewCell) {
        print("Flip taped")
    }
    
    
    //CONTROLL
    
    func CharterControllTableViewCellDidTapAddButton(_ sender: CharterControllTableViewCell) {
        print("Add taped")
    }
    
    func CharterControllTableViewCellDidTapBackButton(_ sender: CharterControllTableViewCell) {
        print("back taped")
    }
    
    func CharterControllTableViewCellDidTapClearButton(_ sender: CharterControllTableViewCell) {
        print("Clear taped")
    }
    
    
    
    @objc func buttonAction(sender: UIButton!) {
        let svc = RequestViewController()
        navigationController?.pushViewController(svc, animated: true)
    }
    
    func setuplayout() {
        
        charterTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(charterTableView)
        charterTableView.translatesAutoresizingMaskIntoConstraints = false
        charterTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        charterTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        charterTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        charterTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        charterTableView.rowHeight = 220
        
        
        requestButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        requestButton.layer.cornerRadius = 25
        self.view.addSubview(requestButton)
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        requestButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        requestButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        requestButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 100).isActive = true
        requestButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        requestButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
       
        
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
