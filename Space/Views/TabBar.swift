//
//  TabBar.swift
//  Space
//
//  Created by Nikita Rossik on 12/10/21.
//

import SwiftUI

struct TabBar: View {
	@State private var selectedTab: CurrentTab = .home
	
	var body: some View {
		ZStack {
			
			viewBody(selectedTab)
			
			HStack {
				ForEach(TabItem.data) { item in
					Button {
						selectedTab = item.tab
					} label: {
						Label {
							Text(item.title)
								.font(.caption2)
								.lineLimit(1)
						} icon: {
							Image(systemName: item.iconName)
								.symbolVariant(.fill)
								.font(.body.bold())
								.frame(width: 80, height: 29)
						}
					}
					.foregroundStyle(.secondary)
				}
				.frame(maxWidth: .infinity)
			}
			.padding(.top, 14)
			.labelStyle(.vertically)
			.frame(height: 88, alignment: .top)
			.materialBackground(cornerRadius: 34)
			.frame(maxHeight: .infinity, alignment: .bottom)
			.ignoresSafeArea()
		}
	}
}

extension TabBar {
	func viewBody(_ tab: CurrentTab) -> some View {
		Group {
			switch tab {
				case .home:
					ContentView()
				case .explore:
					AccountView()
				case .notifications:
					ProgressView {
						Text("Loading…")
							.font(.title)
					}
				case .library:
					Text("Library")
			}
		}
	}
}


struct TabBar_Previews: PreviewProvider {
	static var previews: some View {
		TabBar()
		//			.preferredColorScheme(.dark)
	}
}
