//
//  ContentView.swift
//  Space
//
//  Created by Nikita Rossik on 12/2/21.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 8)  {
			Spacer()
			Image("Logo 2")
				.resizable(resizingMode: .stretch)
				.aspectRatio(contentMode: .fit)
				.frame(width: 26, height: 26)
				.cornerRadius(10)
				.padding(6)
				.materialBackground(cornerRadius: 16)
			
			Text("SwiftUI for iOS 15")
				.font(.largeTitle)
				.fontWeight(.bold)
				.foregroundStyle(titleGradient)
			
			Text("20 sections - 3 hours".uppercased())
				.font(.footnote)
				.fontWeight(.semibold)
				.foregroundStyle(.secondary)
			
			Text("Build an SwiftUI app for iOS 15 with custom layouts and, animation and …")
				.font(.footnote)
				.multilineTextAlignment(.leading)
				.lineLimit(2)
				.frame(maxWidth: .infinity, alignment: .leading)
				.foregroundColor(.secondary)
		}
		.padding(.all, 20)
		.padding(.vertical, 20)
		.frame(height: 350)
		.materialBackground(cornerRadius: 30)
		.strokeStyle()
		.shadow(color: shadownColor, radius: 10, x: 0, y: 10)
		.padding(.horizontal, 20)
		.background(blobOne)
		.overlay(illustrationFive)
		
	}
}

extension ContentView {
	private var shadownColor: Color {
		Color("Shadow")
			.opacity(0.3)
	}
	
	private var blobOne: some View {
		Image("Blob 1")
			.offset(x: 250, y: -100)
	}
	
	private var illustrationFive: some View {
		Image("Illustration 5")
			.resizable()
			.aspectRatio(contentMode: .fit)
			.frame(height: 220)
			.offset(x: 24, y: -80)
	}
	
	private var titleGradient: LinearGradient {
		.linearGradient(colors: [.primary, .primary.opacity(0.5)],
										startPoint: .topLeading, endPoint: .bottomTrailing)
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.preferredColorScheme(.dark)
	}
}
