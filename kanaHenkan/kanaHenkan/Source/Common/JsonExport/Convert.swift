//
//  Convert.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/17.
//  Copyright © 2020 boko. All rights reserved.
//

import Foundation

struct Convert: Codable {
    /**変換後文字列*/
    let converted: String
    /**出力種別*/
    let outputType: String
    /**リクエストID*/
    let requestID: String

    enum CodingKeys: String, CodingKey {
        case converted
        case outputType = "output_type"
        case requestID = "request_id"
    }
}
