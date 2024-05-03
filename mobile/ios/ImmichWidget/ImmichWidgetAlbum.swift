//
//  ImmichWidgetAlbum.swift
//  ImmichWidgetExtension
//
//  Created by Renan Greca on 03/05/24.
//

import Foundation
import AppIntents

struct ImmichWidgetAlbum: AppEntity {
    let id: String

    let title: String

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(stringLiteral: "\(title)")
    }

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Album"
    static var defaultQuery = AlbumQuery()

    static let allAlbums: [ImmichWidgetAlbum] = [
        ImmichWidgetAlbum(id: "maggie", title: "Maggie")
    ]
}

struct AlbumQuery: EntityQuery {

    func entities(for identifiers: [ImmichWidgetAlbum.ID]) async throws -> [ImmichWidgetAlbum] {
        ImmichWidgetAlbum.allAlbums
    }

    func suggestedEntities() async throws -> [ImmichWidgetAlbum] {
        ImmichWidgetAlbum.allAlbums
    }

    func defaultResult() async -> DefaultValue? {
        try? await suggestedEntities().first
    }
}
