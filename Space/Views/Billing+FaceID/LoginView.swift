//
//  LoginView.swift
//  Space
//
//  Created by Nikita Rossik on 12/22/21.
//

import SwiftUI

struct LoginView: View {
	@EnvironmentObject var authAction: AuthenticationAction
	
	var body: some View {
		VStack(spacing: 40) {
			TitleView(text: "View billing history")
			biometricTypeButton
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(gradient)
	}
}


extension LoginView {
	private var gradient: LinearGradient {
		LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
	}
	
	@ViewBuilder
	private var biometricTypeButton: some View {
		switch authAction.biometryType {
		case .touchID:
			PrimaryButtonView(text: "Login with TouchID", image: "touchid", authentacateAction: authAction.authentacateWithBiometrics)
		case .faceID:
			PrimaryButtonView(text: "Login with FaceID", image: "faceid", authentacateAction: authAction.authentacateWithBiometrics)
		default:
			NavigationLink {
				SecretKeyView()
					.environmentObject(authAction)
			} label: {
				PrimaryButtonView(text: "Login with your key", image: nil) {}
			}
			
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
			.environmentObject(AuthenticationAction())
		//			.previewDevice("iPhone 8")
	}
}
