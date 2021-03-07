//
//  CodableImage.swift
//  WidgetExample
//
//  Created by New User on 7/3/21.
//

import Foundation
import SwiftUI
import UIKit

struct CodableImage: Codable {
    let imageData: Data

    var uiImage: UIImage? {
        UIImage(data: imageData)
    }

    init(withImage image: UIImage) {
        imageData = image.pngData()!
    }
}
