//
//  DetailViewController.swift
//  Concurreny
//
//  Created by Ian Bailey on 12/16/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailCapitalLabel: UILabel!
    @IBOutlet weak var detailPopLabel: UILabel!
    
    
    var country : Country!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    private func updateUI() {
        detailNameLabel.text = country?.name
        detailCapitalLabel.text = country?.capital
        detailPopLabel.text = country?.population.description
       ImageHelper.fetchImage(for: "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png") { (result) in
        switch result {
        case .success(let image):
            DispatchQueue.main.async {
                self.detailImageView.image = image
            }
        case .failure(let error):
            print("failed to get image \(error)")
        }
    

}
}
}
