//
//  CharterViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 23/11/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class CharterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let charterTableView = UITableView()
    
    
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
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = charterTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharterSelectionTableViewCell
            return cell
            
        }
        else {
            let cell = charterTableView.dequeueReusableCell(withIdentifier: "control", for: indexPath) as! CharterControllTableViewCell
            return cell
        }
        
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
