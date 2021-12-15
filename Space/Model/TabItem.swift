//
//  Tab.swift
//  Space
//
//  Created by Nikita Rossik on 12/10/21.
//

import SwiftUI


struct TabItem: Identifiable {
	var id = UUID()
	let title: String
	let iconName: String
	let tab: CurrentTab
	var color: Color
}


extension TabItem {
	static var data = [
		Self(title: "Learn Now", iconName: "house", tab: .home, color: .teal),
		Self(title: "Explore", iconName: "magnifyingglass", tab: .explore, color: .blue),
		Self(title: "Notifications", iconName: "bell", tab: .notifications, color: .red),
		Self(title: "Library", iconName: "rectangle.stack", tab: .library, color: .pink)
	]
}


enum CurrentTab: String {
	case home
	case explore
	case notifications
	case library
}

struct TabPreferenceKey: PreferenceKey {
	static var defaultValue: CGFloat = .zero
	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = nextValue() }
}
