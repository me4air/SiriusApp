//
//  CharterViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 23/11/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class CharterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource, CharterControllTableViewCellDelegate, CharterSelectionTableViewCellDelegate, AirportSelectedDelegate {
    
    
    let charterTableView = UITableView()
    
    var datePicker: UIDatePicker?
    
    var passPicker = UIPickerView()
    
    var chartersArray: [CharterInformation] = []
    
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
        chartersArray.append(CharterInformation(date: nil, time: nil, passanger: nil, departureAirport: nil, arivalAirport: nil))
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
        if validation(for: chartersArray.last!) {
            turnOnControls()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return chartersArray.count
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = charterTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharterSelectionTableViewCell
            cell.delegate = self
            cell.tag = indexPath.row
            if let time = chartersArray[indexPath.row].time {
                cell.timeButton.smallLabel.text = time
                cell.timeButton.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                cell.timeButton.imageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                cell.resetTime()
            }
            if let date = chartersArray[indexPath.row].date {
                cell.dateButton.smallLabel.text = date
                cell.dateButton.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                cell.dateButton.imageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                
                cell.resetDate()
            }
            if let pass = chartersArray[indexPath.row].passanger {
                cell.passengerButton.smallLabel.text = pass
                cell.passengerButton.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                cell.passengerButton.imageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                cell.resetPass()
            }
            if let depart = chartersArray[indexPath.row].departureAirport {
                cell.departureButton.stupSelectedLayout()
                cell.departureButton.reloadButtonWithData(dest: "Откуда", code: depart.airportCode, city: depart.airportName + " " + depart.airportCity)
                cell.departureButton.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
            } else {
                cell.departureButton.clearButtonLayout()
                cell.departureButton.bigLabel.text = "Откуда"
            }
            if let arive = chartersArray[indexPath.row].arivalAirport {
                cell.arivalButton.stupSelectedLayout()
                cell.arivalButton.reloadButtonWithData(dest: "Куда", code: arive.airportCode, city: arive.airportName + " " + arive.airportCity)
                cell.departureButton.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
            } else {
                cell.arivalButton.clearButtonLayout()
                cell.arivalButton.bigLabel.text = "Куда"
            }
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
        chartersArray[indexPath.row].passanger = pickerSetas[row]
      /*  if validation(for: chartersArray.last!) {
            turnOnControls()
        } */
    }
    
    
    func set(airport: AirportInformation, for row: Int, with state: BigButtonSide) {
        switch state {
        case .left:
            chartersArray[row].departureAirport = airport
        case .right:
            chartersArray[row].arivalAirport = airport
        }
        if validation(for: chartersArray.last!) {
            turnOnControls()
        }
    }
    
    
    @objc func datePickerValueChanged(picker : UIDatePicker){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd.MM.yy"
        let result = dateformatter.string(from: (datePicker?.date)!)
        let indexPath = IndexPath(row: (datePicker?.tag)!, section: 0)
        let cell = self.charterTableView.cellForRow(at: indexPath) as! CharterSelectionTableViewCell
        cell.dateButton.smallLabel.text = result
        chartersArray[(datePicker?.tag)!].date = result
       
    }
    
    @objc func timePickerValueChanged(picker : UIDatePicker){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm"
        let result = dateformatter.string(from: (datePicker?.date)!)
        let indexPath = IndexPath(row: (datePicker?.tag)!, section: 0)
        let cell = self.charterTableView.cellForRow(at: indexPath) as! CharterSelectionTableViewCell
        cell.timeButton.smallLabel.text = result
        chartersArray[(datePicker?.tag)!].time = result
     
    }
    
    
    
    //SELECTION
    
    func CharterSelectionTableViewCellDidTapTimeButton(_ sender: CharterSelectionTableViewCell) {
        print("Time taped")
        sender.timeButton.smallLabel.isUserInteractionEnabled = true
        sender.timeButton.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        sender.timeButton.smallLabel.tintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        sender.timeButton.smallLabel.text = releseDatePickerView(sender: sender, type: "Time")
        chartersArray[sender.tag].time = sender.timeButton.smallLabel.text
        sender.timeButton.imageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sender.timeButton.smallLabel.becomeFirstResponder()
        
    }
    
    func CharterSelectionTableViewCellDidTapDateButton(_ sender: CharterSelectionTableViewCell) {
        print("Date taped")
        sender.dateButton.smallLabel.isUserInteractionEnabled = true
        sender.dateButton.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        sender.dateButton.smallLabel.tintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        sender.dateButton.smallLabel.text = releseDatePickerView(sender: sender, type: "Date")
        chartersArray[sender.tag].date = sender.dateButton.smallLabel.text
      /*  if validation(for: chartersArray.last!) {
            turnOnControls()
        } */
        sender.dateButton.imageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sender.dateButton.smallLabel.becomeFirstResponder()
    }
    
    func CharterSelectionTableViewCellDidTapPassengerButton(_ sender: CharterSelectionTableViewCell) {
        print("Pass taped")
        sender.passengerButton.smallLabel.isUserInteractionEnabled = true
        sender.passengerButton.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        sender.passengerButton.smallLabel.tintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        sender.passengerButton.smallLabel.text = releseDatePickerView(sender: sender, type: "Pass")
        chartersArray[sender.tag].passanger = sender.passengerButton.smallLabel.text
      /*  if validation(for: chartersArray.last!) {
            turnOnControls()
        } */
        sender.passengerButton.imageButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sender.passengerButton.smallLabel.becomeFirstResponder()
    }
    
    func CharterSelectionTableViewCellDidTapDepartureButton(_ sender: CharterSelectionTableViewCell) {
        print("Dep taped")
        let svc = AirportSearchViewController()
        svc.navigationTitle = "Аэропорт вылета"
        svc.delegate = self
        svc.senderButton = sender.departureButton
        svc.senderButton.tag = sender.tag
        view.endEditing(true)
        navigationController?.pushViewController(svc, animated: true)
    }
    
    func CharterSelectionTableViewCellDidTapArivalButton(_ sender: CharterSelectionTableViewCell) {
        print("Ariv taped")
        let svc = AirportSearchViewController()
        svc.navigationTitle = "Аэропорт прилета"
        svc.delegate = self
        svc.senderButton = sender.arivalButton
        svc.senderButton.tag = sender.tag
        view.endEditing(true)
        navigationController?.pushViewController(svc, animated: true)
    }
    
    func CharterSelectionTableViewCellDidTapFlipButton(_ sender: CharterSelectionTableViewCell) {
        print("Flip taped")
        let tempAirport = chartersArray[sender.tag].arivalAirport
        chartersArray[sender.tag].arivalAirport = chartersArray[sender.tag].departureAirport
        chartersArray[sender.tag].departureAirport = tempAirport
        self.charterTableView.reloadData()
    }
    
    
    //CONTROLL
    
    func CharterControllTableViewCellDidTapAddButton(_ sender: CharterControllTableViewCell) {
        print("Add taped")
        self.chartersArray.append(CharterInformation(date: nil, time: nil, passanger: nil, departureAirport: nil, arivalAirport: nil))
        let controlIndex = IndexPath(row: 0, section: 1)
        let controlCell = self.charterTableView.cellForRow(at: controlIndex) as! CharterControllTableViewCell
        controlCell.activateClear()
        controlCell.disactivateAdd()
        controlCell.disactivateBack()
        disactivateRequestButton()
        self.charterTableView.reloadData()
    }
    
    func CharterControllTableViewCellDidTapBackButton(_ sender: CharterControllTableViewCell) {
        print("back taped")
        let tempCharter = self.chartersArray.last
        chartersArray.append(CharterInformation(date: nil, time: nil, passanger: nil, departureAirport: tempCharter?.arivalAirport, arivalAirport: tempCharter?.departureAirport))
        let controlIndex = IndexPath(row: 0, section: 1)
        let controlCell = self.charterTableView.cellForRow(at: controlIndex) as! CharterControllTableViewCell
        controlCell.activateClear()
        controlCell.disactivateAdd()
        controlCell.disactivateBack()
        disactivateRequestButton()
        self.charterTableView.reloadData()
    }
    
    func CharterControllTableViewCellDidTapClearButton(_ sender: CharterControllTableViewCell) {
        print("Clear taped")
        if chartersArray.count > 2 {
            _ = chartersArray.popLast()
            self.charterTableView.reloadData()
            if validation(for: chartersArray.last!) {
                turnOnControls()
            }
        } else {
            _ = chartersArray.popLast()
            let controlIndex = IndexPath(row: 0, section: 1)
            let controlCell = self.charterTableView.cellForRow(at: controlIndex) as! CharterControllTableViewCell
            controlCell.disactivateClear()
            if validation(for: chartersArray.last!) {
                turnOnControls()
            }
            self.charterTableView.reloadData()
        }
        
    }
    
    
    
    @objc func buttonAction(sender: UIButton!) {
        print(chartersArray)
         let svc = RequestViewController()
         navigationController?.pushViewController(svc, animated: true)
        self.chartersArray = [CharterInformation(date: nil, time: nil, passanger: nil, departureAirport: nil, arivalAirport: nil)]
        let controlIndex = IndexPath(row: 0, section: 1)
        let controlCell = self.charterTableView.cellForRow(at: controlIndex) as! CharterControllTableViewCell
        controlCell.disactivateClear()
        controlCell.disactivateAdd()
        controlCell.disactivateBack()
        self.charterTableView.reloadData()
    }
    
    func validation(for charter: CharterInformation) -> Bool{
        if charter.arivalAirport == nil {
            return false
        }
        if charter.date == nil {
            return false
        }
        if charter.departureAirport == nil {
            return false
        }
        if charter.passanger == nil {
            return false
        }
        if charter.time == nil {
            return false
        }
        return true
    }
    
    func turnOnControls() {
        let controlIndex = IndexPath(row: 0, section: 1)
        let controlCell = self.charterTableView.cellForRow(at: controlIndex) as! CharterControllTableViewCell
        if !(controlCell.addButton.isEnabled){
        controlCell.activateAdd()
        controlCell.activateBack()
        activateRequestButton()
        self.charterTableView.reloadData()
        }
    }
    
    func activateRequestButton(){
        requestButton.isEnabled = true
        requestButton.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
    }
    
    func disactivateRequestButton(){
        requestButton.isEnabled = false
        requestButton.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
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
        requestButton.isEnabled = false
        requestButton.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
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
