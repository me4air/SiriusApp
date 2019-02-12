//
//  ProfileViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 23/11/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    let profileBGImage = UIImageView()
    var profileAvatarImage = UIImageView()
    let menuTableView = UITableView()
    
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.text = "Имя Фамилия"
        return label
    }()
    
    let photoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "photo"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateWithRealm()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
         print("0")
        case 1:
         print("1")
        case 2:
         print("2")
        case 3:
         print("3")
        case 4:
         print("4")
        case 5:
         print("5")
        self.view.window?.rootViewController!.dismiss(animated: true, completion: nil)
        default:
            print("ERROR")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        switch indexPath.row {
        case 0:
            cell.menuLabel.text = "Мои направления"
            cell.menuImage.image = UIImage(named: "dest")
            return cell
        case 1:
            cell.menuLabel.text = "Уведомления"
            cell.menuImage.image = UIImage(named: "bell")
            return cell
        case 2:
            cell.menuLabel.text = "Сменить пароль"
            cell.menuImage.image = UIImage(named: "pass")
            return cell
        case 3:
            cell.menuLabel.text = "Изменить профиль"
            cell.menuImage.image = UIImage(named: "edit")
            return cell
        case 4:
            cell.menuLabel.text = "O Sirius Aero"
            cell.menuImage.image = UIImage(named: "info")
            return cell
        case 5:
            cell.menuLabel.text = "Выйти"
            cell.menuImage.image = UIImage(named: "exit")
            return cell
        default:
            return cell
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
    
  @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileAvatarImage.image = image
        picker.dismiss(animated: true, completion: nil)
    
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func updateWithRealm(){
        let realm = try! Realm()
        let userData = realm.objects(UserData.self).first
        var imageData = Data()
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        if let docDirectory = documentDirectories.first{
            let fileURL = docDirectory.appendingPathComponent("avatar")
            do {
                imageData = try Data(contentsOf: fileURL)
            } catch {
                print(error)
            }
        } else { return }
        if let avatar = UIImage(data: imageData) {
            profileAvatarImage.image = avatar }
        if let name = userData?.name {
            userNameLabel.text = name + " " + (userData?.surName)!
        }
    }
    
    func setupLayout(){
        
    
     
        
        profileBGImage.translatesAutoresizingMaskIntoConstraints = false
        profileBGImage.image = UIImage(named: "ProfileBG")
        self.view.addSubview(profileBGImage)
        profileBGImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        profileBGImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        profileBGImage.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        profileBGImage.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        profileAvatarImage.translatesAutoresizingMaskIntoConstraints = false
        profileAvatarImage.image = UIImage(named: "avava")
        profileAvatarImage.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        profileAvatarImage.contentMode = .scaleAspectFill
        profileAvatarImage.layer.cornerRadius = 50
        profileAvatarImage.clipsToBounds = true
        self.view.addSubview(profileAvatarImage)
        profileAvatarImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        profileAvatarImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        profileAvatarImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileAvatarImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        photoButton.layer.cornerRadius = 18
        photoButton.clipsToBounds = true
        self.view.addSubview(photoButton)
        photoButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        photoButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        photoButton.bottomAnchor.constraint(equalTo: profileAvatarImage.bottomAnchor).isActive = true
        photoButton.rightAnchor.constraint(equalTo: profileAvatarImage.rightAnchor).isActive = true
        photoButton.addTarget(self, action: #selector(photoAction), for: .touchUpInside)
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(userNameLabel)
        userNameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        userNameLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: profileAvatarImage.bottomAnchor, constant: 10).isActive = true
        userNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
      //
        
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.rowHeight = 60
        menuTableView.tableFooterView = UIView()
        self.view.addSubview(menuTableView)
        menuTableView.topAnchor.constraint(equalTo: profileBGImage.bottomAnchor).isActive = true
        menuTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        menuTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
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
