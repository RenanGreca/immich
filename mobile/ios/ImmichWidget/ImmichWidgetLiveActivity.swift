//
//  ImmichWidgetLiveActivity.swift
//  ImmichWidget
//
//  Created by Renan Greca on 03/05/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ImmichWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ImmichWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ImmichWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ImmichWidgetAttributes {
    fileprivate static var preview: ImmichWidgetAttributes {
        ImmichWidgetAttributes(name: "World")
    }
}

extension ImmichWidgetAttributes.ContentState {
    fileprivate static var smiley: ImmichWidgetAttributes.ContentState {
        ImmichWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ImmichWidgetAttributes.ContentState {
         ImmichWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ImmichWidgetAttributes.preview) {
   ImmichWidgetLiveActivity()
} contentStates: {
    ImmichWidgetAttributes.ContentState.smiley
    ImmichWidgetAttributes.ContentState.starEyes
}
