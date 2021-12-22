//
//  AuthenticationAction.swift
//  Space
//
//  Created by Nikita Rossik on 12/22/21.
//

import Foundation
import LocalAuthentication


final class AuthenticationAction: ObservableObject {
	private(set) var context: LAContext = .init()
	private(set) var canEvaluatePolicy: Bool = false
	
	@Published var showAlert: Bool = false
	@Published private(set) var errorDescription: String?
	@Published private(set) var isAuthenticated: Bool = false
	@Published private(set) var biometryType: LABiometryType = .none
	
	internal init() {
		setBiometryType()
	}
}


extension AuthenticationAction {
	func setBiometryType() {
		canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
		biometryType = context.biometryType
	}
	
	func authentacateWithBiometrics() async {
		context = LAContext()
		
		if canEvaluatePolicy {
			let reason: String = "Log into your account"
			
			do {
				let result = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
				
				
				if result {
					DispatchQueue.main.async {
						self.isAuthenticated = true
						print("AUTH: ", self.isAuthenticated)
						
					}
				}
			} catch {
				print(error.localizedDescription)
				DispatchQueue.main.async {
					self.errorDescription = error.localizedDescription
					self.showAlert = true
					self.biometryType  = .none
					
				}
			}
		}
	}
	
	func authentacateWithSecretKey(_ key: String) {
		switch key {
		case "apikey123".lowercased():
			isAuthenticated = true
		default:
			errorDescription = "Wrong secret key"
			showAlert = true
		}
	}
}
