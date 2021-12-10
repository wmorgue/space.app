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
				Spacer()
				
				Label {
					Text("Learn now")
						.font(.caption2)
				} icon: {
					Image(systemName: "house")
						.symbolVariant(.fill)
						.font(.body.bold())
						.frame(width: 80, height: 29)
				}

				Spacer()
				
				Label {
					Text("Explore")
						.font(.caption2)
				} icon: {
					Image(systemName: "magnifyingglass")
						.symbolVariant(.fill)
						.font(.body.bold())
						.frame(width: 80, height: 29)
				}
				Spacer()
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
//			.preferredColorScheme(.dark)
	}
}
