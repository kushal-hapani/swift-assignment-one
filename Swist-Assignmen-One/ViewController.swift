//
//  ViewController.swift
//  Swist-Assignmen-One
//
//  Created by Kushal on 02/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countrisTableView: UITableView?
    
    var countryName: [String] = [
        "Canada",
        "Brazil",
        "China",
        "Germany",
        "Australia",
        "Nigeria",
        "Egypt",
        "India",
        "Russia",
        "United States" ,
    ]

    
    var countryContinent: [String: String] = [
        "Canada": "North America",
        "Brazil": "South America",
        "China": "Asia",
        "Germany": "Europe",
        "Australia": "Australia",
        "Nigeria": "Africa",
        "Egypt": "Africa",
        "India": "Asia",
        "Russia": "Europe/Asia",
        "United States": "North America"
    ]



    override func viewDidLoad() {
        super.viewDidLoad()
        
        countrisTableView?.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constant.cellIdentifier)
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryContinent.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath)
        
        var tableViewContentConfiguration = tableViewCell.defaultContentConfiguration()
        tableViewContentConfiguration.text = countryName[indexPath.row]
        tableViewContentConfiguration.secondaryText = countryContinent[countryName[indexPath.row]]
        
        tableViewCell.contentConfiguration = tableViewContentConfiguration
        
        return tableViewCell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("The Contry is \(countryName[indexPath.row])\nThe Continent is \(countryContinent[countryName[indexPath.row]] ?? "")")
    }
    
}



struct Constant {
    static let cellIdentifier: String = "Cell"
    
}
