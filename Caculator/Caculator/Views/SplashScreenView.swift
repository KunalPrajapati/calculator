//
//  SplashScreenView.swift
//  Caculator
//
//  Created by Kunal 🥀 on 04/01/25.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var isActive : Bool = false
    @State private var size = 0.7
    @State private var opacity = 0.4
    
    var body: some View {
        
        if isActive{
            ContentView()
        }else{
            ZStack{
                LinearGradient(gradient: Gradient(colors:[.pink.opacity(0.3), .purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                Text("Calculator")
                    .font(.system(size: 60))
                    .bold()
                    .padding()
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.1)){
                    self.size = 1.2
                    self.opacity = 1.0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
