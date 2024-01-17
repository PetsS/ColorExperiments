//
//  ArrowView.swift
//  project9_challenge1
//
//  Created by Peter Szots on 14/06/2022.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX , y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                  
        return path
    }
}

struct ArrowView: View {
    @State private var animationAmount = 10.0
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Arrow()
                 .stroke(lineWidth: animationAmount)
                 .frame(width: 200, height: 200)
             
             Button ("Animate") {
                 withAnimation(.easeInOut(duration: 1.6)) {
                     animationAmount = Double.random(in: 5...30)
                 }
             }
             .font(.title.bold().smallCaps())
             .padding(20)
            
            
            Divider()
            
             Slider(value: $animationAmount, in: 5...30)
                .padding(20)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("dismiss")
            }
            .padding()
        }
        .background(.black)
        .preferredColorScheme(.dark)
    }
        
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
