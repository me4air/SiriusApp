//
//  WelcomeViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupLayout()

        // Do any additional setup after loading the view.
    }
    
    @objc func registerButtonAction(sender: UIButton!) {
        let svc = TapBarViewController()
        self.present(svc, animated: true, completion: nil)
        
    }
    
    @objc func enterButtonAction(sender: UIButton!) {
        let svc = TapBarViewController()
        self.present(svc, animated: true, completion: nil)
        
    }
    
    func setupLayout(){
        
        registerButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        registerButton.layer.cornerRadius = 25
        self.view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -215).isActive = true
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
