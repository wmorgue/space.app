//
//  BillingView.swift
//  Space
//
//  Created by Nikita Rossik on 12/22/21.
//

import SwiftUI
import LocalAuthentication

struct BillingView: View {
	@StateObject private var authenticationAction = AuthenticationAction()
	
	var body: some View {
		NavigationView {
			VStack {
				switch authenticationAction.isAuthenticated {
				case true:
					TitleView(text: "Billing History")
					PrimaryButtonView(text: "Back", image: nil, showingImage: false) {
						authenticationAction.logout()
					}
				case false:
					LoginView()
						.environmentObject(authenticationAction)
				}
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.ignoresSafeArea(.all)
			.background(LinearGradient(
				colors: [.blue, .purple],
				startPoint: .topLeading,
				endPoint: .bottomTrailing)
			)
			.alert(isPresented: $authenticationAction.showAlert) {
				alertBiometryType(authenticationAction.biometryType)
			}
		}
	}
}


extension BillingView {
	private func alertBiometryType(_ biometryType: LABiometryType) -> Alert {
		var biometryTitle: Text {
			switch biometryType {
			case .none: return Text("Can't recognize API Key")
			case .touchID: return Text("Can't recognize TouchID")
			case .faceID: return Text("Can't recognize FaceID")
			@unknown default: return Text("Unknown biometry type on device")
			}
		}
		
		var errorMessage: Text {
			Text(authenticationAction.errorDescription ?? "Error to login")
		}
		
		return Alert(
			title: biometryTitle,
			message: errorMessage,
			dismissButton: .destructive(Text("Close"))
		)
	}
}

struct BillingView_Previews: PreviewProvider {
	static var previews: some View {
		BillingView()
	}
}
