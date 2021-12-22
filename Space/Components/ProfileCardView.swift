//
//  ProfileCardView.swift
//  Space
//
//  Created by Nikita Rossik on 12/10/21.
//

import SwiftUI

struct ProfileCardView: View {
	let personName: String
	let countryName: String?
	let imageName: String?
	
	var body: some View {
		VStack(spacing: 8) {
			Image(systemName: systemImageName)
				.symbolVariant(.circle.fill)
				.font(.system(size: 26))
				.symbolRenderingMode(.palette)
				.foregroundStyle(.blue, .blue.opacity(0.3))
				.padding()
				.background(
					Circle().fill(.ultraThinMaterial)
				)
				.background(
					Image(systemName: "hexagon")
						.symbolVariant(.fill)
						.foregroundColor(.blue)
						.font(.system(size: 200))
						.offset(x: -50, y: -80)
				)
				.background(
					BlobShape()
						.offset(x: 200, y: 0)
						.scaleEffect(0.6)
				)
			Text(personName)
				.font(.title.weight(.semibold))
			HStack {
				Image(systemName: "location")
					.imageScale(.large)
				Text(country)
					.foregroundColor(.secondary)
			}
		}
		.frame(maxWidth: .infinity)
		.padding(.bottom)
	}
}

extension ProfileCardView {
	var systemImageName: String {
		imageName ?? "person.crop.circle.fill.badge.checkmark"
	}
	
	var country: String {
		countryName ?? "Hidden"
	}
}


struct ProfileCard_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			List {
				ProfileCardView(
					personName: "Nikita Rossik",
					countryName: nil,
					imageName: nil
				)
			}
		}
	}
}
