//
//  JSONFileLoader.swift
//  LoadFile
//
//  Created by Jeffrey Kereakoglow on 4/7/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

struct JSONFileLoader {
  let fileName: String

  func load() -> AnyObject? {

    if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") {
      // Attempt to convert the JSON file to an NSData object
      do {
        let data = try NSData(
          contentsOfURL: NSURL(fileURLWithPath: path),
          options: .DataReadingMappedIfSafe
        )

        // You may verify the contents of the object `data` by placing a breakpoint at the `return`
        // statement and typing this into LLDB:
        //
        // `po String(data:data, encoding: NSUTF8StringEncoding)`
        do {
          return try NSJSONSerialization.JSONObjectWithData(data, options: [])
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
      print("Unable to find `\(fileName)` in the main bundle.")
    }
    
    return nil
  }
}
