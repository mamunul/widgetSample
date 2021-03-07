//
//  CodableFont.swift
//  WidgetExample
//
//  Created by New User on 7/3/21.
//

import Foundation
import SwiftUI
import UIKit

class CodableFont: Codable {
    let size: CGFloat
    let name: String

    var uiFont: UIFont { UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size) }

    init(font: UIFont) {
        size = font.pointSize
        name = font.fontName
    }
}
