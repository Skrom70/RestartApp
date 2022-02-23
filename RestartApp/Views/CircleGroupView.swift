//
//  CircleGroupView.swift
//  RestartApp
//
//  Created by Viacheslav Tolstopianteko on 30.12.2021.
//

import SwiftUI

struct CircleGroupView: View {
	
	@State var ShapeColor: Color
	@State var ShapeOpacity: Double
	@State private var isAnimation: Bool = false
	
    var body: some View {
		ZStack {
			Circle()
				.stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
				.frame(width: 260, height: 260, alignment: .center)
			
			Circle()
				.stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
				.frame(width: 260, height: 260, alignment: .center)
		} //: ZSTACK
		.blur(radius: isAnimation ? 0 : 10)
		.opacity(isAnimation ? 1 : 0)
		.scaleEffect(isAnimation ? 1 : 0.5)
		.animation(.easeOut(duration: 1), value: isAnimation)
		.onAppear {
			isAnimation = true
		}
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color("ColorBlue")
				.ignoresSafeArea()
			CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
		}
    }
}
