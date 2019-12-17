//
//  ViewController.swift
//  Concurreny
//
//  Created by Ian Bailey on 12/11/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var countries = [Country]() {
        didSet {
            tableView.reloadData()
            
        }
    }
    let data = Bundle.readRawJSONData(filename: "countries", ext: "json")
    
    var searchBarText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        loadData()
        
        
    }

    func searchTerm(searchText: searchBarText) {
        countries = Country.getCountryData(data: data).filter({ ($0.name.lowercased().contains(searchBarText.lowercased()))})
    }
    
    func loadData() {
        countries = Country.getCountryData(data: data)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        detailViewController.country = countries[indexPath.row]
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell else {fatalError("couldn't dequeque cell")
            
        }
        
        let country = countries[indexPath.row]
        cell.configureCell(for: country)
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard !searchText.isEmpty else {
                       loadData()
                       return
                   }
                   searchBarText = searchText
                   searchTerm()
               }
    
       
}
}
