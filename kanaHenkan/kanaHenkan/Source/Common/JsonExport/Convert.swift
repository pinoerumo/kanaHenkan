//
//  Convert.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/17.
//  Copyright © 2020 boko. All rights reserved.
//

import Foundation

struct Convert: Codable {
    let converted, outputType, requestID: String

    enum CodingKeys: String, CodingKey {
        case converted
        case outputType = "output_type"
        case requestID = "request_id"
    }
}
