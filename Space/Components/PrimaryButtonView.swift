//
//  PrimaryButtonView.swift
//  Space
//
//  Created by Nikita Rossik on 12/22/21.
//

import SwiftUI

struct PrimaryButtonView: View {
	var text: String
	var image: String?
	var showingImage: Bool = true
	var authentacateAction: () async -> Void
	
	var body: some View {
		HStack {
			showImageOrEmpty
			Text(text)
		}
		.padding()
		.padding(.horizontal)
		.background(.white)
		.cornerRadius(30)
		.shadow(radius: 10)
		.onTapGesture {
			Task {
				await authentacateAction()
			}
		}
	}
}

extension PrimaryButtonView {
	@ViewBuilder
	var showImageOrEmpty: some View {
		switch showingImage {
		case true:
			Image(systemName: image ?? "person.fill")
				.imageScale(.large)
		case false:
			EmptyView()
		}
	}
}

struct PrimaryButtonView_Previews: PreviewProvider {
	static var previews: some View {
		PrimaryButtonView(text: "Login with Face ID", image: "faceid") {
			
		}
	}
}
