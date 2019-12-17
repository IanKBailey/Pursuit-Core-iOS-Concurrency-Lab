//
//  ImageHelper.swift
//  Concurreny
//
//  Created by Ian Bailey on 12/15/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

struct ImageHelper {

    static func fetchImage(for urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {

        guard let url = URL(string: urlString) else {
            fatalError("bad url \(urlString)")
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, repsonse, error) in
            if let error = error {
                print("error: \(error)")
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
