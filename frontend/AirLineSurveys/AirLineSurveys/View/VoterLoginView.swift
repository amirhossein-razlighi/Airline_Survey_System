//
//  VoterLoginView.swift
//  AirLineSurveys
//
//  Created by Amirhossein Razlighi on 10/01/2023.
//

import SwiftUI

struct VoterLoginView: View {
    @State private var flightNumber = ""
    @State private var ticketNumber = ""
    @State private var goToNextView = false
    @State private var wrongCredentials = false
    @State private var scaleRadOuter : CGFloat = 1.7

    var body: some View {
        
        let scaleRadInner : CGFloat = 1.35
        
        var authManager = AuthManager(isManager: false, username: flightNumber, password: ticketNumber)
        
            ZStack {
                Color.mint
                    .ignoresSafeArea()
                
                Circle()
                    .scale(scaleRadOuter)
                    .foregroundColor(.white.opacity(0.2))
                    .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: scaleRadOuter)
                    .onAppear {
                        scaleRadOuter = 1.7
                        scaleRadOuter += 0.1
                    }
                
                Circle()
                    .scale(scaleRadInner)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login For Voters:")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("flightNumber", text: $flightNumber)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(5)
                        .border(.red, width: wrongCredentials ? 1 : 0)
                    
                    TextField("ticketNumber", text: $ticketNumber)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(5)
                        .border(.red, width: wrongCredentials ? 1 : 0)
                    
                        Button("Login!") {
//                            path.append("NewView")
                            wrongCredentials = authManager.main()
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .navigationDestination(for: String.self) {view in
                            if view == "NewView"{
                                Text("we are here!")
                            }
                        }
                    }
            }
    }
}

struct VoterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        VoterLoginView()
    }
}
