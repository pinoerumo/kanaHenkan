//
//  KHConversionView.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/16.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit

protocol KHConversionViewDelegate: AnyObject {
    func conversionView(_ conversionView: KHConversionView,
                        tappedConversionButton button: UIButton)
}

class KHConversionView: CommonView {
    weak var delegate: KHConversionViewDelegate?
    
    /**変換文字列が入っていない場合表示するラベル*/
    @IBOutlet var cautionLabel: UILabel!
    /**変換文字列入力テキストフィールド*/
    @IBOutlet var conversionTextField: UITextField!
    /**変換タイプ選択セグメント*/
    @IBOutlet var conversionTypeSegment: UISegmentedControl!
    
    
    /// 変換ボタン押下時メソッド
    /// - Parameter sender: 変換ボタン
    @IBAction func tappedConversionButton(_ sender: UIButton) {
        delegate?.conversionView(self, tappedConversionButton: sender)
    }
}
