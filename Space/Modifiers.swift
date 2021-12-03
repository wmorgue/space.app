//
//  Modifiers.swift
//  Space
//
//  Created by Nikita Rossik on 12/2/21.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
	
	@Environment(\.colorScheme) var colorScheme
	
	let cornerRadius: CGFloat
	var gradient: LinearGradient {
		.linearGradient(
			colors: [
				.white.opacity(colorScheme == .dark ? 0.6 : 0.3),
				.black.opacity(colorScheme == .dark ? 0.3 : 0.1)
			],
			startPoint: .top, endPoint: .bottom
		)
	}
	
	
	
	func body(content: Content) -> some View {
		content
			.overlay(
				RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
					.stroke(gradient)
					.blendMode(.overlay)
			)
	}
}

struct MaterialBackground: ViewModifier {
	let cornerRadius: CGFloat
	let style: RoundedCornerStyle
	
	func body(content: Content) -> some View {
		content
			.background(
				.ultraThinMaterial,
				in: RoundedRectangle(cornerRadius: cornerRadius, style: style)
			)
	}
}


extension View {
	func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
		modifier(StrokeStyle(cornerRadius: 30))
	}
	
	func materialBackground(cornerRadius: CGFloat = 20, style: RoundedCornerStyle = .continuous) -> some View {
		modifier(MaterialBackground(cornerRadius: cornerRadius, style: style))
	}
}
