//
//  ControlLibrary.swift
//  Space
//
//  Created by Nikita Rossik on 12/16/21.
//

import SwiftUI


struct Illustration_Five_Library: LibraryContentProvider {
	@LibraryContentBuilder
	var views: [LibraryItem] {
		LibraryItem(
			Image("Illustration 5")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 220)
				.offset(x: 24, y: -80),
			title: "Illustration Five",
			category: .control
		)
	}
}
