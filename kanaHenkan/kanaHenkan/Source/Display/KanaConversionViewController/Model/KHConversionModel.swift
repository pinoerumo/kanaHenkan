//
//  KHConversionModel.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/16.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit

class KHConversionModel {
    var conversionStr : String = ""
    
    func requestConversion(conversionStr: String,
                           completion: @escaping (Result<Convert, APIError>) -> Void) {
        NetworkManager.shared.requestConvert(beforeStr: conversionStr, completion: completion)
    }
}
