//
//  MediumWidgetView.swift
//  WidgetExample
//
//  Created by New User on 4/3/21.
//

import Foundation
import SwiftUI

struct MediumWidgetView: View {
    @Binding var widgetProperty: WidgetProperty
    var body: some View {
        ZStack {
            Image(uiImage: widgetProperty.uiImage)
                .resizable()
                .frame(width: 400, height: 200)
            Text(widgetProperty.title)
                .font(Font(widgetProperty.titleFont))
                .padding()
                .foregroundColor(Color(widgetProperty.titleColor))
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5))
        }
    }
}
