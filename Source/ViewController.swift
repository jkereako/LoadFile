//
//  ViewController.swift
//  LoadFile
//
//  Created by Jeffrey Kereakoglow on 4/7/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let loader = JSONFileLoader(fileName: "example")

    print(loader.load())
  }
}
