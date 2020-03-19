//
//  RubyLabel.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/20.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit

class RubyLabel: UILabel {
    // ルビを表示
    override func draw(_ rect: CGRect) {
        // 描画位置を設定
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.translateBy(x: 0, y: rect.height)
        context.scaleBy(x: 1.0, y: -1.0)

        // ルビを挿入
        guard let attributedText = self.attributedText else { return }
        
        let frame = CTFramesetterCreateFrame(
            CTFramesetterCreateWithAttributedString(attributedText),
            CFRangeMake(0, attributedText.length),
            CGPath(rect: rect, transform: nil),
            nil)

        // 描画に反映
        CTFrameDraw(frame, context)
    }
    
    //高さが変わった際見切れないようにする
    override var intrinsicContentSize: CGSize {
        let baseSize = super.intrinsicContentSize

        return CGSize(width: baseSize.width,
                      height: baseSize.height * 1.5)

    }
}
