//
//  CountryCell.swift
//  Concurreny
//
//  Created by Ian Bailey on 12/12/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryPopulation: UILabel!
    
    
    func configureCell(for country: Country) {
        countryName.text = country.name
        countryCapital.text = country.capital
        countryPopulation.text = country.population.description
        
        ImageHelper.fetchImage(for: "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png") { (result) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.countryImage.image = image
                }
            case .failure(let error):
                print("failed to get image \(error)")
            }
        }
    }
}
