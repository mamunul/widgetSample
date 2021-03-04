//
//  ContentView.swift
//  WidgetExample
//
//  Created by New User on 3/3/21.
//

import SwiftUI

struct SmallWidgetView: View {
    @Binding var widgetProperty: WidgetProperty
    var body: some View {
        ZStack {
            Image(uiImage: widgetProperty.uiImage)
                .resizable()
                .frame(width: 200, height: 200)
            Text(widgetProperty.title)
                .font(widgetProperty.titleFont)
                .padding()
                .foregroundColor(widgetProperty.titleColor)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5))
        }
    }
}

struct MediumWidgetView: View {
    @Binding var widgetProperty: WidgetProperty
    var body: some View {
        ZStack {
            Image(uiImage: widgetProperty.uiImage)
                .resizable()
                .frame(width: 400, height: 200)
            Text(widgetProperty.title)
                .font(widgetProperty.titleFont)
                .padding()
                .foregroundColor(widgetProperty.titleColor)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5))
        }
    }
}

struct LargeWidgetView: View {
    @Binding var widgetProperty: WidgetProperty
    var body: some View {
        ZStack {
            Image(uiImage: widgetProperty.uiImage)
                .resizable()
                .frame(width: 400, height: 400)
            Text(widgetProperty.title)
                .font(widgetProperty.titleFont)
                .padding()
                .foregroundColor(widgetProperty.titleColor)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5))
        }
    }
}

struct WidgetFamilyView: View {
    @Binding var widgetProperty: WidgetProperty
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Group {
                    SmallWidgetView(widgetProperty: $widgetProperty)
                    MediumWidgetView(widgetProperty: $widgetProperty)
                    LargeWidgetView(widgetProperty: $widgetProperty)
                }.cornerRadius(35.0)
            }
        }.padding()
    }
}

let mainPresenter = MainPresenter()

struct ImageSelectorView: View {
    @ObservedObject var presenter: MainPresenter
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(presenter.imageArray, id: \.self) { imageName in
                    Image(uiImage: UIImage(named: imageName)!)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            self.presenter.updateImage(imageName: imageName)
                        }
                }
            }
        }
    }
}

struct TextEditorView: View {
    @ObservedObject var presenter: MainPresenter
    var body: some View {
        TextField(presenter.widgetProperty.title, text: $presenter.widgetProperty.title)
            .padding()
            .border(Color.gray)
    }
}

struct TextColorEditorView: View {
    @ObservedObject var presenter: MainPresenter
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(presenter.colorArray, id: \.self) { color in
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            self.presenter.widgetProperty.titleColor = color
                        }
                }
            }
        }
    }
}

struct TitleFontEditorView: View {
    @ObservedObject var presenter: MainPresenter
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(presenter.fontArray, id: \.self) { font in
                    Text(presenter.placeholderTextForFont)
                        .padding()
                        .font(font)
                        .onTapGesture {
                            self.presenter.widgetProperty.titleFont = font
                        }
                }
            }
        }
    }
}

struct MainView: View {
    @ObservedObject var presenter: MainPresenter = mainPresenter
    var body: some View {
        VStack {
            WidgetFamilyView(widgetProperty: $presenter.widgetProperty)
            ImageSelectorView(presenter: presenter)
            TextEditorView(presenter: presenter)
            TextColorEditorView(presenter: presenter)
            TitleFontEditorView(presenter: presenter)
        }
        .onAppear {
            presenter.loadImages()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
