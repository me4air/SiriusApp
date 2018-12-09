//
//  RequestViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 08/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController {
    
    let planeImage = UIImageView()
    
    let checkImage = UIImageView()
    
    let okButton: UIButton = {
        let button = UIButton()
        button.setTitle("ОК", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    var frameWidth = 0.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        frameWidth = Double(self.view.frame.width)
        setupLayout()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonAction(sender: UIButton!) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .right
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Ваш заказ принят"
        return label
    }()
    
    var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "В ближайшее время с вами свяжется наш менеджер для уточнения способа оплаты"
        return label
    }()
    
    
    
    func setupLayout(){
        
        okButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        okButton.layer.cornerRadius = 25
        self.view.addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        okButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        okButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 100).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        okButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        checkImage.clipsToBounds = true
        checkImage.contentMode = .scaleAspectFill
        checkImage.image = UIImage(named: "check")
        self.view.addSubview(checkImage)
        checkImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        checkImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive = true
        checkImage.widthAnchor.constraint(equalToConstant: CGFloat(frameWidth - 70)).isActive = true
        checkImage.heightAnchor.constraint(equalToConstant: CGFloat(frameWidth - 70)).isActive = true
        
        planeImage.translatesAutoresizingMaskIntoConstraints = false
        planeImage.frame = CGRect(x: 0, y: 0, width: 116, height: 131)
        planeImage.clipsToBounds = true
        planeImage.contentMode = .scaleAspectFill
        planeImage.image = UIImage(named: "bigairpalne")
        self.view.addSubview(planeImage)
        planeImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        planeImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -122).isActive = true
       
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(descLabel)
        descLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7).isActive = true
        descLabel.widthAnchor.constraint(equalToConstant: CGFloat(frameWidth-80)).isActive = true
        
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
