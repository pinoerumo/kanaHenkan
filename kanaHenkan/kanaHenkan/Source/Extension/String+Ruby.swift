//
//  String+Ruby.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/20.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit

extension String {
    // 文字列の範囲
    private var stringRange: NSRange {
        return NSMakeRange(0, self.utf16.count)
    }

    // 特定の正規表現を検索
    private func searchRegex(of pattern: String) -> NSTextCheckingResult? {
        do {
            let patternToSearch = try NSRegularExpression(pattern: pattern)
            return patternToSearch.firstMatch(in: self, range: stringRange)
        } catch { return nil }
    }

    // 特定の正規表現を置換
    private func replaceRegex(of pattern: String, with templete: String) -> String {
        do {
            let patternToReplace = try NSRegularExpression(pattern: pattern)
            return patternToReplace.stringByReplacingMatches(in: self, range: stringRange, withTemplate: templete)
        } catch { return self }
    }

    // ルビを生成
    func createRuby() -> NSMutableAttributedString {
        let textWithRuby = self
            // ルビ付文字(「｜漢字《ルビ》」)を特定し文字列を分割
            .replaceRegex(of: "(｜.+?《.+?》)", with: ",$1,")
            .components(separatedBy: ",")
            // ルビ付文字のルビを設定
            .map { component -> NSAttributedString in
                // ベース文字(漢字など)とルビをそれぞれ取得
                guard let pair = component.searchRegex(of: "｜(.+?)《(.+?)》") else {
                    return NSAttributedString(string: component)
                }
                let component = component as NSString
                let baseText = component.substring(with: pair.range(at: 1))
                let rubyText = component.substring(with: pair.range(at: 2))

                // ルビの表示に関する設定
                let rubyAttribute: [CFString: Any] =  [
                    kCTRubyAnnotationSizeFactorAttributeName: 0.5,
                    kCTForegroundColorAttributeName: UIColor.darkGray
                ]
                let rubyAnnotation = CTRubyAnnotationCreateWithAttributes(
                    .auto, .auto, .before, rubyText as CFString, rubyAttribute as CFDictionary
                )

                return NSAttributedString(string: baseText,
                                          attributes: [kCTRubyAnnotationAttributeName as NSAttributedString.Key: rubyAnnotation])
            }
            // 分割されていた文字列を結合
            .reduce(NSMutableAttributedString()) { $0.append($1); return $0 }
        return textWithRuby
    }
}
