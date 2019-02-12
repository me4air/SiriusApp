//
//  DealsViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 19/11/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit
import Realm
import RealmSwift


class DealsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let cellId = "dealsCell"
    
    let tempDeals = [DealInformation(departureCity: "Москва", destinationCity: "Рига", date: "14 Сентября", plane: "Howker 7000000000", coast: "$ 3 200", time: "08:47", seats: "7 мест", image: "plane"),DealInformation(departureCity: "Таллин", destinationCity: "Сан-Франциско", date: "24 Ноября", plane: "Howker 700", coast: "$ 5 200", time: "08:47", seats: "7 мест", image: "plane2"),DealInformation(departureCity: "Санкт-Питербург", destinationCity: "Рио", date: "01 Декабря", plane: "Howker 700", coast: "$ 200", time: "08:47", seats: "7 мест", image: "plane3"),DealInformation(departureCity: "Москва", destinationCity: "Нижний Новгород", date: "08 Марта", plane: "Howker 700", coast: "$ 3 200", time: "08:47", seats: "7 мест", image: "plane4"),DealInformation(departureCity: "Вышний волочок", destinationCity: "Рим", date: "23 Апреля", plane: "Howker 700", coast: "$ 13 200", time: "08:47", seats: "7 мест", image: "plane3")]
    
    
    let dealsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        //layout.itemSize = CGSize(width:  340 , height: 226) //340
        layout.minimumLineSpacing = 16
        collection.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        return collection
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       // let barBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(pressed))
        let barBtn = UIBarButtonItem(image: UIImage(named: "Filter"), style: .plain, target: self, action: #selector(pressed))
        self.navigationItem.setRightBarButton(barBtn, animated: true)
        self.view.backgroundColor = UIColor.white
        //self.tabBarController?.tabBar.isHidden = false
        setupCollectionView()
     
   
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let svc = SelectedDealViewController()
        navigationController?.pushViewController(svc, animated: true)
    }
    
   @objc func pressed() {
        print("Pressed")
        let svc = FilterViewController()
        navigationController?.pushViewController(svc, animated: true)

    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupCollectionView(){
        view.addSubview(dealsCollectionView)
        dealsCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dealsCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dealsCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        dealsCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        dealsCollectionView.delegate = self
        dealsCollectionView.dataSource = self
        dealsCollectionView.register(DealsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-30, height: 226)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempDeals.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dealsCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DealsCollectionViewCell
        cell.planeLabel.text = tempDeals[indexPath.row].plane
        cell.destinationLabel.text = tempDeals[indexPath.row].destinationCity
        cell.departureLabel.text = tempDeals[indexPath.row].departureCity
        cell.coastLabel.text = tempDeals[indexPath.row].coast
        cell.dateLabel.text = tempDeals[indexPath.row].date
        cell.planeImage.image = UIImage(named: tempDeals[indexPath.row].image)
        return cell
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
