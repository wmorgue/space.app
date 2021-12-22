//
//  AccountView.swift
//  Space
//
//  Created by Nikita Rossik on 12/2/21.
//

import SwiftUI

struct AccountView: View {
	@State private var isPinned: Bool = false
	@State private var isDeleted: Bool = false
	
	
	var body: some View {
		NavigationView {
			List {
				profile
				menu
				linksSection
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
			isPinned.toggle()
		} label: {
			switch isPinned {
				case true:
					Label("Unpin", systemImage: "pin.slash")
				default:
					Label("Pin", systemImage: "pin")
			}
		}
		.tint(isPinned ? .gray : .yellow)
	}
	
	private var profile: some View {
		ProfileCardView(
			personName: "Nikita Rossik",
			countryName: "Russia",
			imageName: nil
		)
	}
	
	private var menu: some View {
		Section {
			NavigationLink {
				Text("Settings View")
			} label: {
				Label("Settings", systemImage: "gear")
			}
			NavigationLink {
				BillingView()
			} label: {
				Label("Billing", systemImage: "creditcard")
			}
			NavigationLink {} label: {
				Label("Help", systemImage: "questionmark")
			}
		}
		.accentColor(.primary)
		.listRowSeparator(.hidden)
	}
	
	@ViewBuilder
	private func links(destination: URL, label: String, image: String) -> some View {
		if !isDeleted {
			Link(destination: destination) {
				HStack {
					Label(label, systemImage: image)
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
	
	private var linksSection: some View {
		Section {
			links(destination: linkToGithub, label: "GitHub", image: "cloud")
			links(destination: linkToGithub, label: "My CV", image: "newspaper")
		}
		.accentColor(.primary)
	}
}


struct AccountView_Previews: PreviewProvider {
	static var previews: some View {
		AccountView()
			.previewDisplayName("Account")
			.preferredColorScheme(.light)
	}
}
