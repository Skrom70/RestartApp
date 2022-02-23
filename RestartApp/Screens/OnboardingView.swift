//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Viacheslav Tolstopianteko on 26.12.2021.
//

import SwiftUI

struct OnboardingView: View {
	
	@AppStorage("onboarding") var isOnboardingViewActive: Bool = false
	
	@State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
	@State private var buttonOffest: CGFloat = 0
	@State private var isAnimating: Bool = false
	@State private var imageOffset: CGSize = .zero
  

	// MARK: - Body
	
    var body: some View {
		ZStack {
			Color("ColorBlue")
				.ignoresSafeArea()
			
			VStack(spacing: 20) {
				
				// MARK: - HEADER
				Spacer()
				
				VStack {
					Text("Share.")
						.font(.system(size: 60))
						.fontWeight(.heavy)
						.foregroundColor(.white)
					
					Text("""
					It's not how much we give but
					how much love we put into giving.
					""")
						.font(.title3)
						.fontWeight(.light)
						.foregroundColor(.white)
						.multilineTextAlignment(.center)
						.padding(.horizontal, 10)
				} //: HEADER
				.opacity(isAnimating ? 1 : 0)
				.offset(y: isAnimating ? 0 : -40)
				.animation(.easeOut(duration: 1), value: isAnimating)
				
				// MARK: - CENTER
				ZStack {
					CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
					
					Image("character-1")
						.resizable()
						.scaledToFit()
						.opacity(isAnimating ? 1 : 0)
						.animation(.easeOut(duration: 0.5), value: isAnimating)
				} //: CENTER
				
				Spacer()
				
				// MARK: - FOOTER
				
				ZStack {
					// PARTS OF THE CUSTOM BUTTON
					
					// 1. BACKGROUND (STATIC)
					
					Capsule()
						.fill(Color.white.opacity(0.2))
					
					Capsule()
						.fill(Color.white.opacity(0.2))
						.padding(8)
					
					
					// 2. CALL-TO-ACTION (STATIC)
					
					Text("Get Started")
						.font(.system(.title3, design: .rounded))
						.fontWeight(.bold)
						.foregroundColor(.white)
						.offset(x: 20)
					
					// 3. CAPSULE (DYNAMIC WIDTH)
					
					HStack {
						Capsule()
							.fill(Color("ColorRed"))
							.frame(width: buttonOffest + 80)
						
						Spacer()
							 
					}
					
					// 4. CIRCLE (DRAGGABLE)
					
					HStack {
						ZStack {
							Circle()
								.fill(Color("ColorRed"))
							
							Circle()
								.fill(.black.opacity(0.15))
								.padding(8)
							
							Image(systemName: "chevron.right.2")
								.font(.system(size: 24, weight: .bold))
						}
						.foregroundColor(.white)
						.frame(width: 80, height: 80, alignment: .center)
						.offset(x: buttonOffest)
						.gesture(
							DragGesture()
								.onChanged { gesture in
									if	gesture.translation.width > 0 && buttonOffest <= buttonWidth - 80 {
										buttonOffest = gesture.translation.width
									}
								}
								.onEnded { _ in
									withAnimation(Animation.easeOut(duration: 0.4)) {
										if buttonOffest > buttonWidth / 2 {
											buttonOffest = buttonWidth - 80
											isOnboardingViewActive = false
										} else {
											buttonOffest = 0
										}
									}
								}
						) //: GESTURE
						
						Spacer()
					} //: HSTACK
					
				} //: FOOTER
				.frame(width: buttonWidth, height: 80, alignment: .center)
				.padding()
				.opacity(isAnimating ? 1 : 0)
				.offset(y: isAnimating ? 0 : 40)
				.animation(.easeOut(duration: 1), value: isAnimating)
			}
		}
		.onAppear {
			isAnimating = true
		}
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
		OnboardingView()
	}
}
