//
//  AppError.swift
//  Concurreny
//
//  Created by Ian Bailey on 12/11/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import Foundation

enum AppError: Error {
  case badURL(String)
  case noResponse
  case networkClientError(Error)
  case noData
  case decodingError(Error)
  case badStatusCode(Int)
  case badMimeType(String)
    
}
