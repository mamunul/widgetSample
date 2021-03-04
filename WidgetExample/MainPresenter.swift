//
//  MainPresenter.swift
//  WidgetExample
//
//  Created by New User on 4/3/21.
//

import Foundation
import SwiftUI

struct WidgetProperty {
    var uiImage = UIImage(named: "AppIcon")
    var title: String = "Placeholder Title"
    var titleColor = Color.red
    var titleFont = Font.custom("Avenir-Light", size: 12)
}

class MainPresenter: ObservableObject {
    @Published var imageArray = [String]()
    @Published var fontArray = [Font]()
    @Published var colorArray = [Color]()
    @Published var imageName = "a.jpg"
    @Published var title: String = "Placeholder Title"
    @Published var titleColor = Color.red
    @Published var titleFont = Font.custom("Avenir-Light", size: 12)
    @Published var placeholderTextForFont = "Baby Photo Editor"

    func loadImages() {
        imageArray = ["a.jpg", "b.jpg", "c.jpg", "d.jpg", "a.jpg", "e.jpg", "f.jpg", "h.jpg"]
        colorArray = [Color.red, Color.gray, Color.blue, Color.orange, Color.green, Color.pink, Color.purple]
        fontArray = [
            Font.custom("Avenir-Light", size: 12),
            Font.custom("BodoniSvtyTwoOSITCTT-Book", size: 12),
            Font.custom("ChalkboardSE-Regular", size: 12),
            Font.custom("Chalkduster", size: 12),
            Font.custom("Futura-CondensedMedium", size: 12),
            Font.custom("TrebuchetMS-Italic", size: 12),
            Font.custom("HiraMinProN-W6", size: 12),
            Font.custom("GillSans-Italic", size: 12),
            Font.custom("Didot", size: 12),
        ]
    }
}
