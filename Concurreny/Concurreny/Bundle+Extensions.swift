//
//  Bundle+Extensions.swift
//  Concurreny
//
//  Created by Ian Bailey on 12/12/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

extension Bundle {
    static func readRawJSONData(filename: String, ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError()
        }
        var data: Data
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError()
        }
        return data
    }
}

