//
//  ObjectArchiver.swift
//  WidgetExample
//
//  Created by New User on 7/3/21.
//

import Foundation
import SwiftUI
import UIKit

class ObjectArchiver {
    let randomFilename = "widgetArchive"
    let sharableGroupIdentifier = "group.com.mamunul.WidgetSampleOBJC"
    // "group.com.mamunul.WidgetExample"
    func archiveObject(widgetProperty: WidgetProperty) {
        let fullPath = getDocumentsDirectory().appendingPathComponent(randomFilename)
        let codableWidget = CodableWidgetProperty(widgetProperty: widgetProperty)

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(codableWidget)
            try data.write(to: fullPath)

        } catch {
            print(error, "Couldn't write file")
        }
    }

    func unarchiveObject() -> WidgetProperty? {
        let fullPath = getDocumentsDirectory().appendingPathComponent(randomFilename)
        let contentData = FileManager.default.contents(atPath: fullPath.path)!
        let decoder = JSONDecoder()
        do {
            let codeableWidget = try decoder.decode(CodableWidgetProperty.self, from: contentData)
            let widget = codeableWidget.convert()

            return widget
        } catch {
            print("Couldn't read file.")
        }
        return nil
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: sharableGroupIdentifier)!
        return paths
    }
}
