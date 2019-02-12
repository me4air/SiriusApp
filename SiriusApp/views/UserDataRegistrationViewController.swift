//
//  RegistrationViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 01/02/2019.
//  Copyright © 2019 me4air. All rights reserved.
//

import UIKit
import TextFieldEffects
import RealmSwift
import Realm

class UserDataRegistrationViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    let gradientLayer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Завершить регистрацию", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
        button.isEnabled = false
        
        return button
    }()
    
    let scrollView : UIScrollView = {
        let view = UIScrollView()
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    let photoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "photo"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        return button
    }()
    
    
    
    let termsSwitch = UISwitch()

    var textView: UITextView = {
        let label = UITextView()
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.textColor = #colorLiteral(red: 0.0993161872, green: 0.2197046876, blue: 0.3857451081, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        label.isEditable = false
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.sizeToFit()
        let attributedString = NSMutableAttributedString(string: "Я принимаю Условия использования и Политику конфиденциальности")
        attributedString.addAttribute(.link, value: "https://sirius-aero.ru", range: NSRange(location: 11, length: 21))
        attributedString.addAttribute(.link, value: "https://sirius-aero.ru/privacy-policy/", range: NSRange(location: 35, length: 27))
        label.attributedText = attributedString
        return label
    }()
    
    
    let cyrcleImageView = UIImageView()
    
    let nameTextField = HoshiTextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-100, height: 60))
    
    let surnameTextField = HoshiTextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-100, height: 60))
    
    
    var currentTextField: UITextField? = UITextField()
    
 
    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.isHidden = false
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
 

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
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
        
        if validator() {
            nextButton.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
            nextButton.isEnabled = true
        } else {
            nextButton.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
            nextButton.isEnabled = false
        }
        return true
    }
    
    @objc func doneButtonAction(sender: UIButton!) {
       self.view.endEditing(true)
    }
    
    @objc func nextButtonAction(sender: UIButton!) {
        
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let imageData =  (self.cyrcleImageView.image?.jpegData(compressionQuality: 0))
        let user = UserData()
        user.name = self.nameTextField.text!
        user.surName = self.surnameTextField.text!
        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .userInitiated)
        dispatchQueue.async{
            if let docDirectory = documentDirectories.first{
                let fileURL = docDirectory.appendingPathComponent("avatar")
                try! imageData!.write(to: fileURL, options: .atomic)
                print(fileURL.absoluteString)
                print("SAVED")
                user.avatar = fileURL.absoluteString
                let realm = try! Realm()
                let users = realm.objects(UserData.self)
                if let oldUser = users.first {
                    try! realm.write {
                        oldUser.name = user.name
                        oldUser.surName = user.surName
                        oldUser.avatar = user.avatar
                    }
                } else {
                try! realm.write {
                    realm.add(user)
                    }
                }
            }
        }
        let svc = TapBarViewController()
        self.present(svc, animated: true, completion: nil)
    }
    
    
    @objc func SwitchVaueChanged(sender: UISwitch!) {
        
        if validator() {
            nextButton.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
            nextButton.isEnabled = true
        } else {
            nextButton.backgroundColor = #colorLiteral(red: 0.6549019608, green: 0.7215686275, blue: 0.8156862745, alpha: 1)
            nextButton.isEnabled = false
        }
    }
    
    @objc func photoAction(sender: UIButton!) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Смена аватара", message: "Источник изображения", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Камера", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true) }
            else {
                print("Camera not avalible")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Библиотека", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        cyrcleImageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func validator() -> Bool {
        if termsSwitch.isOn && (nameTextField.text?.count)!>0 && (surnameTextField.text?.count)!>0 {
            return true
        } else {
            print(termsSwitch.isOn)
            print((nameTextField.text?.count)!>0)
            print((surnameTextField.text?.count)!>0)
            return false
        }
    }
    
    func setupLayout(){
        
        
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
        cyrcleImageView.layer.cornerRadius = 50
        cyrcleImageView.clipsToBounds = true
        cyrcleImageView.contentMode = .scaleAspectFill
        cyrcleImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: self.view.frame.height/6-50).isActive = true
        
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        photoButton.layer.cornerRadius = 18
        photoButton.clipsToBounds = true
        scrollView.addSubview(photoButton)
        photoButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        photoButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        photoButton.bottomAnchor.constraint(equalTo: cyrcleImageView.bottomAnchor).isActive = true
        photoButton.rightAnchor.constraint(equalTo: cyrcleImageView.rightAnchor).isActive = true
        photoButton.addTarget(self, action: #selector(photoAction), for: .touchUpInside)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.delegate = self
        scrollView.addSubview(nameTextField)
        nameTextField.keyboardType = .default
        nameTextField.placeholderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        nameTextField.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        nameTextField.placeholder = "Имя"
        nameTextField.placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
        nameTextField.borderInactiveColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        nameTextField.borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        nameTextField.placeholderFontScale = 1
        nameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: cyrcleImageView.bottomAnchor, constant: 40).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width-100).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
     
        
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        surnameTextField.delegate = self
        scrollView.addSubview(surnameTextField)
        surnameTextField.keyboardType = .default
        surnameTextField.placeholderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        surnameTextField.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        surnameTextField.placeholder = "Фамилия"
        surnameTextField.placeholderColor = #colorLiteral(red: 0.4784313725, green: 0.5921568627, blue: 0.6549019608, alpha: 1)
        surnameTextField.borderInactiveColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        surnameTextField.borderActiveColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        surnameTextField.placeholderFontScale = 1
        surnameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40).isActive = true
        surnameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width-100).isActive = true
        surnameTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(textView)
        textView.leftAnchor.constraint(equalTo: surnameTextField.leftAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 40).isActive = true
      //  textView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -100).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        termsSwitch.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(termsSwitch)
        termsSwitch.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 40).isActive = true
        termsSwitch.rightAnchor.constraint(equalTo: surnameTextField.rightAnchor).isActive = true
        termsSwitch.isOn = false
        termsSwitch.onTintColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        termsSwitch.addTarget(self, action: #selector(SwitchVaueChanged), for: .valueChanged)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.cornerRadius = 25
        scrollView.addSubview(nextButton)
        nextButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: self.view.frame.width-100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 65).isActive = true
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        
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
