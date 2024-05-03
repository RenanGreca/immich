//
//  ImmichWidget.swift
//  ImmichWidget
//
//  Created by Renan Greca on 03/05/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: SelectAlbumIntent())
    }

    func snapshot(for configuration: SelectAlbumIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: SelectAlbumIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let sharedDefaults = UserDefaults.init(suiteName: "group.app.alextran.immich")

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: SelectAlbumIntent
}

struct ImmichWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Album title:")
            Text(entry.configuration.album.title)
        }
    }
}

struct ImmichWidget: Widget {
    let kind: String = "app.widget.albumwidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: SelectAlbumIntent.self,
            provider: Provider()) { entry in
            ImmichWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension SelectAlbumIntent {
    fileprivate static var maggie: SelectAlbumIntent {
        let intent = SelectAlbumIntent()
        intent.album = ImmichWidgetAlbum(id: "maggie", title: "Maggie")
        return intent
    }
}

#Preview(as: .systemSmall) {
    ImmichWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .maggie)
}
