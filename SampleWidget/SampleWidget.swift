//
//  SampleWidget.swift
//  SampleWidget
//
//  Created by New User on 4/3/21.
//

import Intents
import SwiftUI
import WidgetKit

struct Provider: IntentTimelineProvider {
    private let objectArchiver = ObjectArchiver()
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), widgetProperty: WidgetProperty(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), widgetProperty: WidgetProperty(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        let midnight = Calendar.current.startOfDay(for: currentDate)
        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!

//        let defaults = UserDefaults(suiteName: "group.com.mamunul.WidgetExample")
        var widget = WidgetProperty()
//        widget = defaults?.object(forKey: "widgetProperty") as? WidgetProperty ?? WidgetProperty()

        widget = getUpdatedWidget()

        for offset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: offset, to: midnight)!
            entries.append(SimpleEntry(date: entryDate, widgetProperty: widget, configuration: configuration))
        }

        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
        completion(timeline)
    }

    private func getUpdatedWidget() -> WidgetProperty {
        objectArchiver.unarchiveObject() ?? WidgetProperty()
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    var widgetProperty: WidgetProperty
    let configuration: ConfigurationIntent
}

struct SampleWidgetEntryView: View {
    @State var entry: Provider.Entry
    @Environment(\.widgetFamily) var family: WidgetFamily

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall: SmallWidgetView(widgetProperty:
                Binding<WidgetProperty>(
                    get: { entry.widgetProperty },
                    set: { entry.widgetProperty = $0 }
                )
            )
        case .systemMedium: MediumWidgetView(widgetProperty: $entry.widgetProperty)
        case .systemLarge: LargeWidgetView(widgetProperty: $entry.widgetProperty)
        default: SmallWidgetView(widgetProperty: $entry.widgetProperty)
        }
    }
}

@main
struct SampleWidget: Widget {
    let kind: String = "SampleWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SampleWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct SampleWidget_Previews: PreviewProvider {
    static var previews: some View {
        SampleWidgetEntryView(
            entry: SimpleEntry(
                date: Date(),
                widgetProperty: WidgetProperty(),
                configuration: ConfigurationIntent()
            )
        )
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
