//
//  CodableWidgetProperty.swift
//  WidgetExample
//
//  Created by New User on 7/3/21.
//

import Foundation
import SwiftUI
import UIKit

struct CodableWidgetProperty: Codable {
    var color: CodableColor
    var font: CodableFont
    var image: CodableImage
    var title: String = "Placeholder Title"

    init(widgetProperty: WidgetProperty) {
        color = CodableColor(uiColor: widgetProperty.titleColor)
        font = CodableFont(font: widgetProperty.titleFont)
        title = widgetProperty.title
        image = CodableImage(withImage: widgetProperty.uiImage)
    }

    func convert() -> WidgetProperty {
        var widget = WidgetProperty()

        widget.title = title
        widget.titleFont = font.uiFont
        widget.titleColor = color.uiColor
        widget.uiImage = image.uiImage!

        return widget
    }
}
