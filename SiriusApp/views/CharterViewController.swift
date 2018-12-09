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
    


    override func viewDidLoad() {
        super.viewDidLoad()
        charterTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        charterTableView.dataSource = self
        charterTableView.delegate = self
        charterTableView.allowsSelection = false
        charterTableView.register(CharterSelectionTableViewCell.self, forCellReuseIdentifier: "cell")
        setuplayout()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = charterTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharterSelectionTableViewCell
        return cell
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
