//
//  MainPresenter.swift
//  WidgetExample
//
//  Created by New User on 4/3/21.
//

import Foundation
import SwiftUI
import WidgetKit

class MainPresenter: ObservableObject {
    @Published var imageArray = [String]()
    @Published var fontArray = [UIFont]()
    @Published var colorArray = [UIColor]()
    @Published var placeholderTextForFont = "Baby Photo Editor"
    @Published var widgetProperty = WidgetProperty() {
        didSet {
            updateWidget()
        }
    }

    private let objectArchiver: ObjectArchiver

    init() {
        objectArchiver = ObjectArchiver()
    }

    func updateImage(imageName: String) {
        widgetProperty.uiImage = UIImage(named: imageName)!
    }

    func loadResources() {
        imageArray = ["a.jpg", "b.jpg", "c.jpg", "d.jpg", "e.jpg", "f.jpg", "h.jpg"]
        colorArray = [UIColor.black, UIColor.red, UIColor.gray, UIColor.blue, UIColor.orange, UIColor.green, UIColor.purple]

        fontArray = [
            UIFont(name: "Avenir-Light", size: 12)!,
            UIFont(name: "BodoniSvtyTwoOSITCTT-Book", size: 12)!,
            UIFont(name: "ChalkboardSE-Regular", size: 12)!,
            UIFont(name: "Chalkduster", size: 12)!,
            UIFont(name: "Futura-CondensedMedium", size: 12)!,
            UIFont(name: "TrebuchetMS-Italic", size: 12)!,
            UIFont(name: "HiraMinProN-W6", size: 12)!,
            UIFont(name: "GillSans-Italic", size: 12)!,
            UIFont(name: "Didot", size: 12)!,
        ]
    }

    private func updateWidget() {
        objectArchiver.archiveObject(widgetProperty: widgetProperty)
        WidgetCenter.shared.reloadAllTimelines()
    }
}
