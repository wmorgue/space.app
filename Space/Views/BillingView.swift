//
//  BillingView.swift
//  Space
//
//  Created by Nikita Rossik on 12/22/21.
//

import SwiftUI

struct BillingView: View {
	@StateObject private var authenticationAction = AuthenticationAction()
	
	var body: some View {
		NavigationView {
			VStack {
				switch authenticationAction.isAuthenticated {
				case true:
					Text("Billing History")
				case false:
					LoginView()
						.environmentObject(authenticationAction)
				}
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.ignoresSafeArea(.all)
			.alert(isPresented: $authenticationAction.showAlert) { authAlert }
		}
	}
}


extension BillingView {
	private var authAlert: Alert {
		Alert(
			title: Text("Can't recognize FaceID"),
			message: Text(authenticationAction.errorDescription ?? "Error to login"),
			dismissButton: .destructive(Text("Close"))
		)
	}
}

struct BillingView_Previews: PreviewProvider {
	static var previews: some View {
		BillingView()
	}
}
