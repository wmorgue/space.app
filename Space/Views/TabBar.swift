//
//  TabBar.swift
//  Space
//
//  Created by Nikita Rossik on 12/10/21.
//

import SwiftUI

struct TabBar: View {
	var body: some View {
		ZStack(alignment: .bottom) {
			ContentView()
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			HStack {
				ForEach(TabItem.data) { item in
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

struct TabBar_Previews: PreviewProvider {
	static var previews: some View {
		TabBar()
			.preferredColorScheme(.dark)
	}
}
