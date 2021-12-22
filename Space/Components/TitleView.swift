//
//  TitleView.swift
//  Space
//
//  Created by Nikita Rossik on 12/22/21.
//

import SwiftUI

struct TitleView: View {
	let text: String
	
	var body: some View {
		Text(text)
			.font(.title.bold())
			.foregroundColor(.white)
	}
}

struct TitleView_Previews: PreviewProvider {
	static var previews: some View {
		TitleView(text: "Hello loud people")
			.background(
				LinearGradient(
					colors: [.blue, .purple],
					startPoint: .topLeading,
					endPoint: .bottomTrailing)
			)
	}
}
