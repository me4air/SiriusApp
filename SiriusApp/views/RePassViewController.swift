//
//  RePassViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 11/02/2019.
//  Copyright © 2019 me4air. All rights reserved.
//

import UIKit
import Alamofire
import TextFieldEffects

class RePassViewController: UIViewController, UITextFieldDelegate {

  
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выслать новый", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.isEnabled = false
        return button
    }()
    
        var mainLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
            label.numberOfLines = 1
            label.lineBreakMode = .byTruncatingTail
            label.textAlignment = .left
            label.adjustsFontForContentSizeCategory = true
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.2
            label.sizeToFit()
            label.text = "Забыли пароль?"
            return label
        }()
        
        var descriptionLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
            label.numberOfLines = 4
            label.lineBreakMode = .byTruncatingTail
            label.textAlignment = .left
            label.adjustsFontForContentSizeCategory = true
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.2
            label.sizeToFit()
            label.text = "Введите E-mail который был использован при регистрации, и мы отправим вам новый пароль"
            return label
        }()
    
    let emailImageView = UIImageView()
    let emailTextField = HoshiTextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-100, height: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.hideKeyboardWhenTappedAround()
        stupLayout()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
    
        return true
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
        
        
        
        if validation() {
            print("TRUE")
            sendButton.isEnabled = true
            sendButton.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        } else {
            print("FALSE")
            sendButton.isEnabled = false
            sendButton.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
        }
        
        return true
    }
    
    
    func validation() -> Bool {
        
        if isValidEmail(testStr: emailTextField.text!) {
            return true
        } else {
            print(isValidEmail(testStr: emailTextField.text!))
            return false
        }
    }
    
    @objc func sendButtonAction(sender: UIButton!) {
        navigationController?.popViewController(animated: true)
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
        func stupLayout(){
            
            mainLabel.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(mainLabel)
            mainLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
            mainLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
            mainLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
            
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(descriptionLabel)
            descriptionLabel.leftAnchor.constraint(equalTo: mainLabel.leftAnchor).isActive = true
            descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10).isActive = true
            descriptionLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
            
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            emailTextField.delegate = self
            view.addSubview(emailTextField)
            emailTextField.keyboardType = .emailAddress
            emailTextField.placeholderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            emailTextField.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            emailTextField.placeholder = "Email"
            emailTextField.placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
            emailTextField.borderInactiveColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            emailTextField.borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
            emailTextField.placeholderFontScale = 1
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50).isActive = true
            emailTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width-130).isActive = true
            emailTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            emailImageView.translatesAutoresizingMaskIntoConstraints = false
            emailImageView.image = UIImage(named: "emailgray")
            emailImageView.contentMode = .scaleAspectFit
            view.addSubview(emailImageView)
            emailImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            emailImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            emailImageView.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -5).isActive = true
            emailImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
            
            
            sendButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            sendButton.layer.cornerRadius = 25
            self.view.addSubview(sendButton)
            sendButton.translatesAutoresizingMaskIntoConstraints = false
            sendButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            sendButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
            sendButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 100).isActive = true
            sendButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            sendButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
            
        }
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
