//
//  ContentView.swift
//  WidgetExample
//
//  Created by New User on 3/3/21.
//

import Intents
import SwiftUI
import WidgetKit

struct SmallWidgetView: View {
    var uiImage: UIImage
    @Binding var title: String
    @Binding var titleColor: Color
    @Binding var titleFont: Font
    var body: some View {
        ZStack {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: 200, height: 200)
            Text(title)
                .font(titleFont)
                .padding()
                .foregroundColor(titleColor)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5))
        }
    }
}

struct MediumWidgetView: View {
    var uiImage: UIImage
    @Binding var title: String
    @Binding var titleColor: Color
    @Binding var titleFont: Font
    var body: some View {
        ZStack {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: 400, height: 200)
            Text(title)
                .font(titleFont)
                .padding()
                .foregroundColor(titleColor)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5))
        }
    }
}

struct LargeWidgetView: View {
    var uiImage: UIImage
    @Binding var title: String
    @Binding var titleColor: Color
    @Binding var titleFont: Font
    var body: some View {
        ZStack {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: 400, height: 400)
            Text(title)
                .font(titleFont)
                .padding()
                .foregroundColor(titleColor)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5))
        }
    }
}

struct WidgetFamilyView: View {
    var uiImage: UIImage
    @Binding var title: String
    @Binding var titleColor: Color
    @Binding var titleFont: Font
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Group {
                    SmallWidgetView(uiImage: uiImage, title: $title, titleColor: $titleColor, titleFont: $titleFont)
                    MediumWidgetView(uiImage: uiImage, title: $title, titleColor: $titleColor, titleFont: $titleFont)
                    LargeWidgetView(uiImage: uiImage, title: $title, titleColor: $titleColor, titleFont: $titleFont)
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
                            self.presenter.imageName = imageName
                        }
                }
            }
        }
    }
}

struct TextEditorView: View {
    @ObservedObject var presenter: MainPresenter
    var body: some View {
        TextField(presenter.title, text: $presenter.title)
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
                            self.presenter.titleColor = color
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
                            self.presenter.titleFont = font
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
            WidgetFamilyView(uiImage: UIImage(named: presenter.imageName)!, title: $presenter.title, titleColor: $presenter.titleColor, titleFont: $presenter.titleFont)
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
