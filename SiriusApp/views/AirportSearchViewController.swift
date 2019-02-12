//
//  AirportSearchViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 16/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

protocol AirportSelectedDelegate
{
    func set(airport: AirportInformation, for row: Int, with state: BigButtonSide)
}

class AirportSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{
 
    var delegate:AirportSelectedDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    let airportsTableView = UITableView()
    let identifire = "cell"
    var navigationTitle = ""
    var senderButton = BigCharterUIButton()
    var filteredAirports = [AirportInformation]()

    
    let airports : [AirportInformation] = [AirportInformation.init(airportName: "Domodedovo airport", airportCity: "Russia Moskow", airportCode: "DME"),AirportInformation.init(airportName: "Sheremetievo airport", airportCity: "Russia Moskow", airportCode: "SHM"),AirportInformation.init(airportName: "Pulkovo airport", airportCity: "Russia Moskow", airportCode: "PUL"),AirportInformation.init(airportName: "Voronezh chertovitski", airportCity: "Russia Voronezh", airportCode: "CHE"),AirportInformation.init(airportName: "Alaska airport", airportCity: "Alaska USA", airportCode: "ALA"),AirportInformation.init(airportName: "Riga airport", airportCity: "Riga Latvia", airportCode: "RIX"),AirportInformation.init(airportName: "Tallin airport", airportCity: "Essi Tallin", airportCode: "TML"),AirportInformation.init(airportName: "Rio Airport", airportCity: "Brazill Rio", airportCode: "RIO"),AirportInformation.init(airportName: "Saratov airport", airportCity: "Russia Saratov", airportCode: "SAA"),AirportInformation.init(airportName: "Norilsk Airport", airportCity: "Russia Norilsk", airportCode: "NOR"),AirportInformation.init(airportName: "New York airport", airportCity: "NY USA", airportCode: "NYA")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        self.navigationItem.largeTitleDisplayMode =  .always
        self.navigationItem.title = navigationTitle
        self.definesPresentationContext = true
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.navigationBar.tintColor = .white
       
        setupLayout()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return filteredAirports.count
        }
        return airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = airportsTableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! airportSearchTableViewCell
        var airport: AirportInformation
        if isFiltering(){
            airport = filteredAirports[indexPath.row]
        } else {
            airport = airports[indexPath.row]
        }
        let bgView = UIView()
        bgView.backgroundColor = #colorLiteral(red: 0.1119579956, green: 0.3406354727, blue: 0.7734375, alpha: 1)
        cell.selectedBackgroundView = bgView
        cell.separatorInset = UIEdgeInsets.zero
        cell.airportNameLabel.text = airport.airportName
        cell.cityCodeLabel.text =  airport.airportCode
        cell.cityNameLabel.text = airport.airportCity
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var airport: AirportInformation
        if isFiltering(){
            airport = filteredAirports[indexPath.row]
        } else {
            airport = airports[indexPath.row]
        }
        delegate?.set(airport: airport, for: senderButton.tag, with: senderButton.buttonSide)
        senderButton.codeLabel.text = airport.airportCode
        senderButton.cityLabel.text = airport.airportName + " " + airport.airportCity
        senderButton.stupSelectedLayout()
        self.navigationController?.popViewController(animated: true)
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
       filteredAirports = airports.filter({( airport : AirportInformation) -> Bool in
            let filterInfo = airport.airportName.lowercased() + " " + airport.airportCity.lowercased()
            return filterInfo.contains(searchText.lowercased())
            //return airport.airportName.lowercased().contains(searchText.lowercased())
        })
        airportsTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("UPD")
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func setupLayout(){
        
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Введите название аэропорта"
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        
        
        airportsTableView.delegate = self
        airportsTableView.dataSource = self
        airportsTableView.register(airportSearchTableViewCell.self, forCellReuseIdentifier: identifire)
        airportsTableView.translatesAutoresizingMaskIntoConstraints = false
        airportsTableView.rowHeight = 58
        airportsTableView.separatorColor = #colorLiteral(red: 0.3490196078, green: 0.4392156863, blue: 0.5568627451, alpha: 1)
        airportsTableView.backgroundColor = #colorLiteral(red: 0.07905242592, green: 0.2042176723, blue: 0.3619660139, alpha: 1)
        airportsTableView.separatorStyle = .singleLine
        self.view.addSubview(airportsTableView)
        airportsTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        airportsTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        airportsTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        airportsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
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
