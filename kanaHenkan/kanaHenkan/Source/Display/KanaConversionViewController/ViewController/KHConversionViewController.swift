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
        conversionView.delegate = self
        model.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTextField()
    }
    
    func prepareTextField() {
        conversionView.conversionTextField.delegate = self
    }
}

extension KHConversionViewController: KHConversionViewDelegate{
    /// 変換ボタン押下時のデリゲートメソッド
    func conversionView(_ conversionView: KHConversionView, tappedConversionButton button: UIButton) {
        conversionView.endEditing(true)
        model.conversionStr = conversionView.conversionTextField.text ?? ""
        
        if(model.conversionStr.count != 0){
            model.requestConversion(conversionStr: model.conversionStr,conversionType: model.conversionType,completion:
                { result in
                    switch result {
                    case .success(let convert):
                        self.model.convertStringToRubyFormat(beforeString: self.model.conversionStr, afterString: convert.converted)
                        break
                    case .failure(let error):
                        print(error)
                        break
                    }
            })
        }else{
            conversionView.changeCautionLabelDisplay(isShow: false)
        }
    }
    
    /// 変換タイプセグメント変更時のデリゲートメソッド
    func conversionView(_ conversionView: KHConversionView, conversionTypeChanged segment: UISegmentedControl) {
        model.conversionTypeInt = segment.selectedSegmentIndex
    }
}

extension KHConversionViewController: KHConversionModelDelegate{
    //
    func conversionModel(_ conversionModel: KHConversionModel, sendRubyString rubyString: String) {
        self.conversionView.setUpRubyLabel(dispStr: rubyString)
    }
}

extension KHConversionViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        conversionView.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        conversionView.changeCautionLabelDisplay(isShow: true)
        return true
    }
}
