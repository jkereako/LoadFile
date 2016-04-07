//
//  JSONFileLoader.swift
//  LoadFile
//
//  Created by Jeffrey Kereakoglow on 4/7/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

struct JSONFileLoader {
  let basePath: String
  let fileName: String

  func load() -> [AnyObject]? {

    if let path = NSBundle.mainBundle().pathForResource(
      fileName, ofType: "json", inDirectory: basePath
      ) {
      // Attempt to convert the JSON file to an NSData object
      do {
        let data = try NSData(
          contentsOfURL: NSURL(fileURLWithPath: path),
          options: .DataReadingMappedIfSafe
        )

        // Attempt to convert the JSON data to an JSON object
        do {
          return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [AnyObject]
        }

        catch {
          print("Unable to parse JSON from data.")
        }

      }

      catch {
        print(error)
      }
    }

    else {
      print("Path `\(basePath + fileName)` invalid.")
    }
    
    return nil
  }
}
