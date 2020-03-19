//
//  KHConversionModel.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/16.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit

class KHConversionModel {
    /**変換前文字列*/
    var conversionStr:String = ""
    /**変換タイプ*/
    var conversionTypeInt:Int = 0
    /**変換タイプ*/
    var conversionType:String{
        get{
            return conversionTypeInt == 0 ? paramHiragana : paramKatakana
        }
    }
    
    
    /// 変換前、変換後の文字列を元に「｜文字列《ルビ》」の形に変換し返却
    /// - Parameters:
    ///   - beforeString: 変換前文字列
    ///   - afterString: 変換後文字列
    func convertStringToRubyFormat(beforeString: String, afterString: String) {
        let rubyStr = rubyStartStr + beforeString + rubyLeftBrackets + afterString + rubyRightBrackets
        delegate?.conversionModel(self, sendRubyString: rubyStr)
    }
    
    func requestConversion(conversionStr: String,
                           conversionType: String,
                           completion: @escaping (Result<Convert, APIError>) -> Void) {
        NetworkManager.shared.requestConvert(beforeStr: conversionStr, conversionType: conversionType, completion: completion)
    }
}
