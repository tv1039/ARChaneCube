//
//  ColorPalette.swift
//  ChangeCube
//
//  Created by 홍승표 on 5/9/24.
//

import Foundation
import SwiftUI

struct ColorOptions {
    static var all: [Color] = [
        .black,
        .gray,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .cyan,
        .indigo,
        .purple,
        .pink,
        .white
    ]
    
    static var `default`: Color = Color.primary
    
    // 이벤트 에디터에 랜덤 컬러로 나오게 할거
    static func random() -> Color {
        if let element = ColorOptions.all.randomElement() {
            return element
        } else {
            return.primary
        }
    }
    
}

