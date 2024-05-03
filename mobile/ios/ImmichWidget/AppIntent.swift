//
//  AppIntent.swift
//  ImmichWidget
//
//  Created by Renan Greca on 03/05/24.
//

import WidgetKit
import AppIntents

struct SelectAlbumIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select Album"
    static var description = IntentDescription("Selects the album to display in the widget.")

    // An example configurable parameter.
    @Parameter(title: "Album")
    var album: ImmichWidgetAlbum

    init(album: ImmichWidgetAlbum) {
        self.album = album
    }

    init () {

    }
}
