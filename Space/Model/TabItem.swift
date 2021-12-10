//
//  Tab.swift
//  Space
//
//  Created by Nikita Rossik on 12/10/21.
//

import Foundation


struct TabItem: Identifiable {
	var id = UUID()
	let title: String
	let iconName: String
}


extension TabItem {
	static var data = [
		Self(title: "Learn Now", iconName: "house"),
		Self(title: "Explore", iconName: "magnifyingglass"),
		Self(title: "Notifications", iconName: "bell"),
		Self(title: "Library", iconName: "rectangle.stack")
	]
}
