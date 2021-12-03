//
//  AccountView.swift
//  Space
//
//  Created by Nikita Rossik on 12/2/21.
//

import SwiftUI

struct AccountView: View {
	@State private var isDeleted: Bool = false
	
	
	var body: some View {
		NavigationView {
			List {
				VStack(spacing: 8) {
					Image(systemName: "person.crop.circle.fill.badge.checkmark")
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
					Text("Nikita Rossik")
						.font(.title.weight(.semibold))
					HStack {
						Image(systemName: "location")
							.imageScale(.large)
						Text("Russia")
							.foregroundColor(.secondary)
					}
				}
				.frame(maxWidth: .infinity)
				.padding(.bottom)
				
				Section {
					NavigationLink {
						Text("Settings View")
					} label: {
						Label("Settings", systemImage: "gear")
					}
					NavigationLink {
						Text("Billing View")
					} label: {
						Label("Billing", systemImage: "creditcard")
					}
					NavigationLink {} label: {
						Label("Help", systemImage: "questionmark")
					}
				}
				.accentColor(.primary)
				.listRowSeparator(.hidden)
				
				Section {
					if !isDeleted {
						Link(destination: linkToGithub) {
							HStack {
								Label("Github", systemImage: "icloud")
								Spacer()
								Image(systemName: "link")
									.foregroundColor(.secondary)
							}
						}
						.swipeActions {
							deleteAction
							pinAction
						}
					}
				}
				.accentColor(.primary)
				
			}
			.listStyle(.insetGrouped)
			.navigationTitle("Account")
		}
	}
}


extension AccountView {
	private var linkToGithub: URL {
		URL(string: "https://github.com/wmorgue/space.app") ??
		URL(string: "https://github.com/wmorgue")!
	}
	
	private var deleteAction: some View {
		Button(role: .destructive) {
			isDeleted.toggle()
		} label: {
			Label("Delete", systemImage: "trash")
		}
	}
	
	private var pinAction: some View {
		Button {
			// action
		} label: {
			Label("Pin", systemImage: "pin")
		}
		.tint(.yellow)
	}
}


struct AccountView_Previews: PreviewProvider {
	static var previews: some View {
		AccountView()
			.previewDisplayName("Account")
			.preferredColorScheme(.light)
	}
}
