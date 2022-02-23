//
//  ContentView.swift
//  RestartApp
//
//  Created by Viacheslav Tolstopianteko on 26.12.2021.
//

import SwiftUI

struct ContentView: View {
	@AppStorage("onboarding") var isOnboardingViewActive: Bool = true
	
    var body: some View {
		ZStack {
			if isOnboardingViewActive {
				OnboardingView()
			} else {
				HomeView()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
