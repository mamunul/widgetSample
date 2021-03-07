//
//  SwiftImporter.swift
//  WidgetSampleOBJC
//
//  Created by New User on 7/3/21.
//

import Foundation
import SwiftUI
import UIKit

class SwiftImporter: NSObject {
    var priceFor499 = 0
    var priceFor999 = 0
    func returnClassInstance() -> Self {
        return self
    }

    @objc func printHello(controlPrice: Int, challengerPrice: Int) {
        priceFor499 = challengerPrice
        priceFor999 = controlPrice
        print("swiftvc printHello ", controlPrice, " challenger ", challengerPrice)
    }

    @objc func loadSwiftUI() -> UIViewController {
        let ux = MainView()
        return UIHostingController(rootView: ux)
    }

    @objc override init() {
        print("hello init in swiftvc")
    }
}
