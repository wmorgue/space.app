//
//  HexagonView.swift
//  Space
//
//  Created by Nikita Rossik on 12/10/21.
//

import SwiftUI

struct HexagonView: View {
	var body: some View {
		Canvas { context, size in
			context.draw(Text("Kekw"), at: CGPoint(x: 150, y: 300))
			context.fill(Path(ellipseIn: CGRect(x: 0, y: 0, width: 100, height: 100)), with: .color(.pink))
			context.draw(Image("Blob 1"), in: CGRect(x: 70, y: 70, width: 200, height: 200))
		}
	}
}

struct HexagonView_Previews: PreviewProvider {
	static var previews: some View {
		HexagonView()
	}
}
