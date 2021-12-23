//
//  SecretKeyView.swift
//  Space
//
//  Created by Nikita Rossik on 12/22/21.
//

import SwiftUI

struct SecretKeyView: View {
	@State private var apiKey: String = ""
	@EnvironmentObject var authAction: AuthenticationAction
	
	var body: some View {
		VStack(spacing: 40) {
			TitleView(text: "API Key")
			Spacer()
			SecureField("Key", text: $apiKey)
			Spacer()
			PrimaryButtonView(text: "Login", image: nil, showingImage: false) {
				authAction.authentacateWithSecretKey(apiKey)
			}
		}
		.padding()
		.textFieldStyle(.roundedBorder)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(gradient)
	}
}


extension SecretKeyView {
	private var gradient: LinearGradient {
		LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
	}
}


struct SecretKeyView_Previews: PreviewProvider {
	static var previews: some View {
		SecretKeyView()
			.environmentObject(AuthenticationAction())
	}
}
