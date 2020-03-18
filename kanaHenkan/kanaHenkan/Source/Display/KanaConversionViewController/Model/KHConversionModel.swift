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
            return conversionTypeInt == 0 ? "hiragana" : "katakana"
        }
    }
    
    
    func requestConversion(conversionStr: String,
                           conversionType: String,
                           completion: @escaping (Result<Convert, APIError>) -> Void) {
        NetworkManager.shared.requestConvert(beforeStr: conversionStr, conversionType: conversionType, completion: completion)
    }
}
