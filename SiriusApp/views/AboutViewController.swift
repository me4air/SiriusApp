//
//  AboutViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 12/02/2019.
//  Copyright © 2019 me4air. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    let planeImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.isNavigationBarHidden = false
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    func setupLayout(){
        planeImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(planeImageView)
        planeImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width-30).isActive = true
        planeImageView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        planeImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        planeImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        planeImageView.image = UIImage(named: "Sirius-Aero_logo")
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
