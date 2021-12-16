//
//  TabBar.swift
//  Space
//
//  Created by Nikita Rossik on 12/10/21.
//

import SwiftUI

struct TabBar: View {
	private let previewData = TabItem.data
	@State private var tabItemWidth: CGFloat = .zero
	@State private var colorButtonBar: Color = .teal
	@State private var selectedTab: CurrentTab = .home
	
	var body: some View {
		ZStack(alignment: .bottom) {
			
			tabContent
			buttonsBar
				.padding(.horizontal, 8)
				.padding(.top, 14)
				.labelStyle(.vertically)
				.frame(height: 88, alignment: .top)
				.materialBackground(cornerRadius: 34)
				.background(
					barOverlay(colorButtonBar, width: tabItemWidth)
				)
				.overlay(
					barOverlay(colorButtonBar, width: tabItemWidth, isOverlay: true)
				)
				.frame(maxHeight: .infinity, alignment: .bottom)
				.ignoresSafeArea()
		}
	}
}

extension TabBar {
	var tabContent: some View {
		Group {
			switch selectedTab {
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
		.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
	
	private var buttonsBar: some View {
		HStack {
			ForEach(previewData) { item in
				Button {
					withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
						selectedTab = item.tab
						colorButtonBar = item.color
					}
				} label: {
					Label {
						Text(item.title)
							.font(.caption2)
							.lineLimit(1)
					} icon: {
						Image(systemName: item.iconName)
							.symbolVariant(.fill)
							.font(.body.bold())
							.frame(width: 44, height: 29)
					}
					.frame(maxWidth: .infinity)
				}
				.foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
				.blendMode(selectedTab == item.tab ? .overlay : .normal)
				.overlay(
					GeometryReader { proxy in
						Color
							.clear
							.preference(key: TabPreferenceKey.self, value: proxy.size.width)
					}
				)
				.onPreferenceChange(TabPreferenceKey.self) { value in
					tabItemWidth = value
				}
			}
		}
	}
	
	// So scarry, but it's working
	private func barOverlay(_ circleColor: Color, width: CGFloat, isOverlay: Bool = false) -> some View {
		HStack {
			if selectedTab == .library { Spacer() }
			if selectedTab == .explore { Spacer() }
			if selectedTab == .notifications {
				Spacer()
				Spacer()
			}
			switch isOverlay {
				case true:
					Rectangle()
						.fill(circleColor)
						.frame(width: 26, height: 4)
						.cornerRadius(3)
						.frame(width: width)
						.frame(maxHeight: .infinity, alignment: .top)
				case false:
					Circle()
						.fill(circleColor)
						.frame(width: width)
			}
			if selectedTab == .home { Spacer() }
			if selectedTab == .explore {
				Spacer()
				Spacer()
			}
			if selectedTab == .notifications { Spacer() }
		}
		.padding(.horizontal, 8)
	}
}


struct TabBar_Previews: PreviewProvider {
	static var previews: some View {
		TabBar()
			.preferredColorScheme(.dark)
		//			.previewInterfaceOrientation(.landscapeRight)
	}
}
