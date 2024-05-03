//
//  ImmichWidgetBundle.swift
//  ImmichWidget
//
//  Created by Renan Greca on 03/05/24.
//

import WidgetKit
import SwiftUI

@main
struct ImmichWidgetBundle: WidgetBundle {
    var body: some Widget {
        ImmichWidget()
        ImmichWidgetLiveActivity()
    }
}
