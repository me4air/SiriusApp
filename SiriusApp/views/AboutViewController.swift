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
    
    var aboutLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.2196078431, blue: 0.3843137255, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = ""
        return label
    }()
    
    let longText = """
    Sirius Aero – одна из старейших российских компаний деловой авиации. Мы выполняем внутренние и международные чартерные авиаперевозки практически во все страны мира.
    
    Парк воздушных судов Sirius Aero – это современные иностранные бизнес джеты и российские бизнес лайнеры с премиальной конфигурацией салона. Всего в нашем флоте 9 типов самолётов. 
    
    Sirius Aero – самый крупный коммерческий оператор в Восточной Европе. Деятельность нашей компании соответствует российскому и международному воздушному законодательству. Это подтверждено соответствующими сертификатами и лицензиями.
"""

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
        
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(aboutLabel)
        aboutLabel.topAnchor.constraint(equalTo: planeImageView.bottomAnchor, constant: 10).isActive = true
        aboutLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        aboutLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15).isActive = true
        aboutLabel.text = longText
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
