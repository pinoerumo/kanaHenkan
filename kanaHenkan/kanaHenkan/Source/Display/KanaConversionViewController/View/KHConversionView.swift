//
//  KHConversionView.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/16.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit
import PKHUD

protocol KHConversionViewDelegate: AnyObject {
    func conversionView(_ conversionView: KHConversionView,
                        tappedConversionButton button: UIButton)
    
    func conversionView(_ conversionView: KHConversionView,
                        conversionTypeChanged segment: UISegmentedControl)
}

class KHConversionView: CommonView {
    weak var delegate: KHConversionViewDelegate?
    
    /**変換文字列が入っていない場合表示するラベル*/
    @IBOutlet var cautionLabel: UILabel!
    /**変換文字列入力テキストフィールド*/
    @IBOutlet var conversionTextField: UITextField!
    /**変換文字列にルビを振った文字列を表示するラベル*/
    @IBOutlet var conversionLabel: RubyLabel!
    
    
    /// ルビを含んだ文字列を出力する
    /// - Parameter dispStr: ｜漢字《ルビ》の形式で作成された文字列
    func setUpRubyLabel(dispStr: String) {
        conversionLabel.attributedText = dispStr.createRuby()
        conversionLabel.textAlignment = .center
        conversionLabel.font = .systemFont(ofSize: 27.0)
    }
    
    
    /// 警告ラベルを非表示にするメソッド
    /// - Parameter isNotShow: true:非表示　false:表示
    func changeCautionLabelDisplay(isNotShow: Bool) {
        cautionLabel.isHidden = isNotShow
    }
    
    /// 変換ボタン押下時メソッド
    /// - Parameter sender: 変換ボタン
    @IBAction func tappedConversionButton(_ sender: UIButton) {
        delegate?.conversionView(self, tappedConversionButton: sender)
    }
    
    
    /// 変換タイプセグメント値変更時
    /// - Parameter sender: conversionTypeSegment
    @IBAction func conversionTypeChanged(_ sender: UISegmentedControl) {
        delegate?.conversionView(self, conversionTypeChanged: sender)
    }
    
    
}
