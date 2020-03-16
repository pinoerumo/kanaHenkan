//
//  KHConversionViewController.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/16.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit

class KHConversionViewController: UIViewController {
    private let conversionView = KHConversionView()
    private let model = KHConversionModel()
    
    override func loadView() {
        self.view = conversionView;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
