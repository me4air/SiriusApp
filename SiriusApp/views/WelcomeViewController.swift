//
//  WelcomeViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UITextViewDelegate {
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    let enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.0993161872, green: 0.2197046876, blue: 0.3857451081, alpha: 1), for: .normal)
        return button
    }()

    let backgroundImage = UIImageView()
    
    let logoImage = UIImageView()
    
    var textView: UITextView = {
        let label = UITextView()
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.textColor = #colorLiteral(red: 0.0993161872, green: 0.2197046876, blue: 0.3857451081, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        label.isEditable = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.sizeToFit()
        let attributedString = NSMutableAttributedString(string: "Пользуясь услугами Sirius Aero, вы принимаете Условия пользования и Политику конфиденциальности")
        attributedString.addAttribute(.link, value: "https://sirius-aero.ru", range: NSRange(location: 46, length: 19))
        attributedString.addAttribute(.link, value: "https://sirius-aero.ru/privacy-policy/", range: NSRange(location: 68, length: 27))
        
        
        label.attributedText = attributedString
        
      //  label.text = "Пользуясь услугами SiriusJet, вы принимаете Условия пользования и Политику конфиденциальности"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupLayout()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func registerButtonAction(sender: UIButton!) {
        
        let svc = RegistrationViewController()
        svc.title = "Регистрация"
        navigationController?.pushViewController(svc, animated: true)
        
        //let svc = TapBarViewController()
        //self.present(svc, animated: true, completion: nil)
        
    }
    
    @objc func enterButtonAction(sender: UIButton!) {
        let svc = EnterViewController()
        svc.title = "Вход"
        navigationController?.pushViewController(svc, animated: true)
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
    
    func setupLayout(){
        
        backgroundImage.image = UIImage(named: "bg")
        self.view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        registerButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        registerButton.layer.cornerRadius = 25
        self.view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -(self.view.frame.height/3)).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 100).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        
        enterButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        enterButton.layer.cornerRadius = 25
        self.view.addSubview(enterButton)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        enterButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20).isActive = true
        enterButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 100).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enterButton.addTarget(self, action: #selector(enterButtonAction), for: .touchUpInside)
        
        logoImage.image = UIImage(named: "logo")
        self.view.addSubview(logoImage)
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 136).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 170).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -90).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textView)
        textView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40).isActive = true
        textView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -55).isActive = true
        textView.textAlignment = .center
        
        
        
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
