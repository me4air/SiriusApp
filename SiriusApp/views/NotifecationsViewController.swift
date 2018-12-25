//
//  NotifecationsViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 23/11/2018.
//  Copyright © 2018 me4air. All rights reserved.
//



import UIKit

class NotifecationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NotificationTableViewCellDelegate {


    var oldNotifivations = [NotificationInformation.init(title: "Deal:", dealButtonText: "Москва-Рига", shortText: "5 января, Hawker 750 VQ-BBQ, $2750", LongText: "Основное тело сообщения. Парк воздушных судов Sirius Aero – это современные иностранные бизнес джеты и российские бизнес лайнеры с премиальной конфигурацией салона.", isLongTextShown: false),NotificationInformation.init(title: "Deal:", dealButtonText: "Лондон-Париж", shortText: "5 января, Hawker 750 VQ-BBQ, $2750", LongText: "Основное тело сообщения. Парк воздушных судов Sirius Aero – это современные иностранные бизнес джеты и российские бизнес лайнеры с премиальной конфигурацией салона.", isLongTextShown: false), NotificationInformation.init(title: "Deal:", dealButtonText: "Москва-Рига", shortText: "5 января, Hawker 750 VQ-BBQ, $2750", LongText: "Основное тело сообщения. Парк воздушных судов Sirius Aero – это современные иностранные бизнес джеты и российские бизнес лайнеры с премиальной конфигурацией салона.", isLongTextShown: false)]
    
    var newNotifivations = [NotificationInformation.init(title: "Deal:", dealButtonText: "Астана-Багдад", shortText: "5 января, Hawker 750 VQ-BBQ, $2750", LongText: "Основное тело сообщения. Парк воздушных судов Sirius Aero – это современные иностранные бизнес джеты и российские бизнес лайнеры с премиальной конфигурацией салона.", isLongTextShown: false),NotificationInformation.init(title: "Deal:", dealButtonText: "Минск-Кейптаун", shortText: "5 января, Hawker 750 VQ-BBQ, $2750", LongText: "Основное тело сообщения. Парк воздушных судов Sirius Aero – это современные иностранные бизнес джеты и российские бизнес лайнеры с премиальной конфигурацией салона.", isLongTextShown: false), NotificationInformation.init(title: "Deal:", dealButtonText: "Москва-Рига", shortText: "5 января, Hawker 750 VQ-BBQ, $2750", LongText: "Основное тело сообщения. Парк воздушных судов Sirius Aero – это современные иностранные бизнес джеты и российские бизнес лайнеры с премиальной конфигурацией салона.", isLongTextShown: false)]
    
    let identifire = "cell"
    
    let notificationsTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
      

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
          self.tabBarItem.badgeValue = nil
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return newNotifivations.count
        } else {
            return oldNotifivations.count
        }
        
    }
    
    func NotificationTableViewCellDidTapMoreButton(_ sender: NotificationTableViewCell) {
        if sender.indexPath.section == 0 {
            if newNotifivations[sender.indexPath.row].isLongTextShown{
                newNotifivations[sender.indexPath.row].isLongTextShown = false
            } else {
                newNotifivations[sender.indexPath.row].isLongTextShown = true
            }
            notificationsTableView.reloadData()
        } else {
            if  oldNotifivations[sender.indexPath.row].isLongTextShown {
                oldNotifivations[sender.indexPath.row].isLongTextShown = false
            } else {
                oldNotifivations[sender.indexPath.row].isLongTextShown = true
            }
            notificationsTableView.reloadData()
        }
    }
    
    func NotificationTableViewCellDidTapDealButton(_ sender: NotificationTableViewCell) {
        let svc = SelectedDealViewController()
        navigationController?.pushViewController(svc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1 :
            return "Просмотренные"
        default :
            return ""
            
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! NotificationTableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        if indexPath.section == 0 {
            cell.dealButton.setTitle(newNotifivations[indexPath.row].dealButtonText, for: .normal)
            cell.shortTextLabel.text = newNotifivations[indexPath.row].shortText
            if newNotifivations[indexPath.row].isLongTextShown {
                cell.longTextLabel.text = newNotifivations[indexPath.row].LongText
                cell.showMoreButton.setTitle("скрыть", for: .normal)
            } else {
                cell.longTextLabel.text = ""
                cell.showMoreButton.setTitle("Показать полностью...", for: .normal)
            }
        } else {
            
            cell.dealButton.setTitle(oldNotifivations[indexPath.row].dealButtonText, for: .normal)
            cell.shortTextLabel.text = oldNotifivations[indexPath.row].shortText
            if oldNotifivations[indexPath.row].isLongTextShown {
                cell.longTextLabel.text = oldNotifivations[indexPath.row].LongText
                cell.showMoreButton.setTitle("скрыть", for: .normal)
            } else {
                cell.longTextLabel.text = ""
                cell.showMoreButton.setTitle("Показать полностью...", for: .normal)
            }
            
        }
        return cell
        
    }
    

    func setupLayout(){
        notificationsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(notificationsTableView)
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        notificationsTableView.estimatedRowHeight = 200
        notificationsTableView.rowHeight = UITableView.automaticDimension
        notificationsTableView.sectionHeaderHeight = 50
        notificationsTableView.allowsSelection = false
        notificationsTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        notificationsTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        notificationsTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        notificationsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        notificationsTableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: identifire)
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
