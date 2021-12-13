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
	let tab: CurrentTab
}


extension TabItem {
	static var data = [
		Self(title: "Learn Now", iconName: "house", tab: .home),
		Self(title: "Explore", iconName: "magnifyingglass", tab: .explore),
		Self(title: "Notifications", iconName: "bell", tab: .notifications),
		Self(title: "Library", iconName: "rectangle.stack", tab: .library)
	]
}


enum CurrentTab: String {
	case home
	case explore
	case notifications
	case library
}
