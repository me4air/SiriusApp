//
//  RegistrationViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 01/02/2019.
//  Copyright © 2019 me4air. All rights reserved.
//

import UIKit
import TextFieldEffects

class RegistrationViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    
    let gradientLayer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
        button.isEnabled = false
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    let scrollView : UIScrollView = {
        let view = UIScrollView()
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    let phoneImageView = UIImageView()
    let emailImageView = UIImageView()
    let lockImageView = UIImageView()
    
    var phoneData = ""
    
    let cyrcleImageView = UIImageView()
    
    let phoneTextField = HoshiTextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-100, height: 60))
    
    let emailTextField = HoshiTextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-100, height: 60))
    
    let passTextField = HoshiTextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-100, height: 60))
    
    var currentTextField: UITextField? = UITextField()
    
 
    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = .white
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
 

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {

        
        let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let keyboardSize:CGSize = keyboardFrame.size
        
        let contentInsets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect:CGRect = self.view.frame
        aRect.size.height -= keyboardSize.height
        
        if !(aRect.contains(currentTextField!.frame.origin)){
            
            scrollView.scrollRectToVisible(currentTextField!.frame, animated: true)
            
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        
        let contentInsents:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsents
        scrollView.scrollIndicatorInsets = contentInsents
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        if textField.keyboardType == .phonePad {
            if string == "" {
                phoneData = String(phoneData.dropLast())
                print(phoneData)
            }
            if phoneData.count < 11 {
                phoneData += string
                textField.text = formattedNumber(number: textField.text!)
            } else {
                if string != "" {
                    return false
                }
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        (textField as! HoshiTextField).placeholderLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        currentTextField = nil
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if (textField.text?.isEmpty)! {
        (textField as! HoshiTextField).placeholderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
            (textField as! HoshiTextField).placeholderLabel.frame = CGRect(x: (textField as! HoshiTextField).placeholderLabel.frame.minX, y: (textField as! HoshiTextField).placeholderLabel.frame.minY, width: textField.frame.width, height: (textField as! HoshiTextField).placeholderLabel.frame.height)
        }
        
        if textField.tag == 0 {
            if (phoneData.count<6){
                if (textField.text?.count)! > 0 {
                    (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                    (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                    (textField as! HoshiTextField).placeholder = "Телефон слишком короткий"
                } else {
                    (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
                    (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                    (textField as! HoshiTextField).placeholder = "Телефон"
                }
                
            } else {
                (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                (textField as! HoshiTextField).placeholder = "Телефон"
            }
        }
        
        if textField.tag == 1 {
            if !isValidEmail(testStr: textField.text!){
                if (textField.text?.count)! > 0 {
                 (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                 (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                 (textField as! HoshiTextField).placeholder = "Неверный формат Email"
                } else {
                    (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
                    (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                    (textField as! HoshiTextField).placeholder = "Email"
                }
                
            } else {
                (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                (textField as! HoshiTextField).placeholder = "Email"
            }
        }
        
        if textField.tag == 2 {
            
            if ((textField.text?.count)!<6){
                if (textField.text?.count)! > 0 {
                    (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                    (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                    (textField as! HoshiTextField).placeholder = "Слишком короткий пароль"
                } else {
                    (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
                    (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                    (textField as! HoshiTextField).placeholder = "Пароль"
                }
                
            } else {
                (textField as! HoshiTextField).placeholderColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                (textField as! HoshiTextField).borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
                (textField as! HoshiTextField).placeholder = "Пароль"
            }
            
        }
        
        if validation() {
            print("TRUE")
            nextButton.isEnabled = true
            nextButton.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        } else {
            print("FALSE")
            nextButton.isEnabled = false
            nextButton.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
        }
        
        return true
    }
    
    @objc func doneButtonAction(sender: UIButton!) {
       self.view.endEditing(true)
    }
    
    @objc func nextButtonAction(sender: UIButton!) {
        let svc = UserDataRegistrationViewController()
        navigationController?.pushViewController(svc, animated: true)
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func validation() -> Bool {
        
        if isValidEmail(testStr: emailTextField.text!) && ((passTextField.text?.count)!>5) && (phoneData.count>6) {
            return true
        } else {
            print(isValidEmail(testStr: emailTextField.text!))
            print((passTextField.text?.count)!>5)
            print(phoneData.count)
            return false
        }
    }
    
    
    func setupLayout(){
        
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        scrollView.contentSize.height = self.view.frame.height
        scrollView.isScrollEnabled = true

        self.view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
   
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/6)
        gradient.masksToBounds = false
        gradient.locations = [0.0, 1.0]
        gradient.colors = [#colorLiteral(red: 0.1176470588, green: 0.2784313725, blue: 0.4784313725, alpha: 1) as CGColor, #colorLiteral(red: 0.0862745098, green: 0.3647058824, blue: 0.6, alpha: 1) as CGColor]
        scrollView.layer.addSublayer(gradient)
        
        
        cyrcleImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(cyrcleImageView)
        cyrcleImageView.image = UIImage(named: "registerava")
        cyrcleImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        cyrcleImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cyrcleImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cyrcleImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: self.view.frame.height/6-50).isActive = true
        
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.delegate = self
        scrollView.addSubview(phoneTextField)
        phoneTextField.keyboardType = .phonePad
        phoneTextField.placeholderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        phoneTextField.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        phoneTextField.placeholder = "Телефон"
        phoneTextField.placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
        phoneTextField.borderInactiveColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        phoneTextField.borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        phoneTextField.placeholderFontScale = 1
        phoneTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: cyrcleImageView.bottomAnchor, constant: 40).isActive = true
        phoneTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width-130).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        phoneTextField.tag = 0
        
        phoneImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneImageView.image = UIImage(named: "phoneicon")
        scrollView.addSubview(phoneImageView)
        phoneImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        phoneImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneImageView.bottomAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: -5).isActive = true
        phoneImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30).isActive = true
        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        scrollView.addSubview(emailTextField)
        emailTextField.keyboardType = .emailAddress
        emailTextField.placeholderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        emailTextField.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        emailTextField.placeholder = "Email"
        emailTextField.placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
        emailTextField.borderInactiveColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        emailTextField.borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        emailTextField.placeholderFontScale = 1
        emailTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 40).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width-130).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        emailTextField.tag = 1
        
        emailImageView.translatesAutoresizingMaskIntoConstraints = false
        emailImageView.image = UIImage(named: "emailgray")
        emailImageView.contentMode = .scaleAspectFit
        scrollView.addSubview(emailImageView)
        emailImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        emailImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        emailImageView.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -5).isActive = true
        emailImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30).isActive = true
        
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.delegate = self
        scrollView.addSubview(passTextField)
        passTextField.keyboardType = .default
        passTextField.isSecureTextEntry = true
        passTextField.placeholderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        passTextField.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        passTextField.placeholder = "Пароль"
        passTextField.placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
        passTextField.borderInactiveColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        passTextField.borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        passTextField.placeholderFontScale = 1
        passTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40).isActive = true
        passTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width-130).isActive = true
        passTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        passTextField.tag = 2
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        lockImageView.image = UIImage(named: "locking")
        lockImageView.contentMode = .scaleAspectFit
        scrollView.addSubview(lockImageView)
        lockImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        lockImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lockImageView.bottomAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: -5).isActive = true
        lockImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 30).isActive = true
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.cornerRadius = 25
        scrollView.addSubview(nextButton)
        nextButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: self.view.frame.width-100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 65).isActive = true
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
      
        
        self.phoneTextField.inputAccessoryView = toolbar
        
    }
    
    
    private func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "X (XXX) XXX-XX-XX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask {
            if index == cleanPhoneNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
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
