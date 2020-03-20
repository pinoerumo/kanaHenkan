//
//  CommonAPI.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/20.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit

class CommonAPI: NSObject {
    /// アラートを表示させる
    /// - Parameters:
    ///   - title: アラートのタイトル
    ///   - message: アラートのメッセージ
    ///   - targetVC: 表示するVC
    class func alert(title:String, message:String, targetVC:UIViewController) {
        var alertController: UIAlertController!
        alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: nil))
        targetVC.present(alertController, animated: true)
        
    }
}
