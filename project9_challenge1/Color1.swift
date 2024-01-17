//
//  Color1.swift
//  project9_challenge1
//
//  Created by Peter Szots on 14/06/2022.
//

import SwiftUI

struct Color1: View {
    
    @State private var red = 0.0
    @State private var green = 0.0
    @State private var blue = 0.0
    
    var body: some View {
        
        VStack {
            Rectangle()
                Color(red: red, green: green, blue: blue)
            
            HStack {
                VStack {
                    Text("red")
                        .font(.caption)
                    Slider(value: $red, in: 0...1)
                }
                VStack {
                    Text("green")
                        .font(.caption)
                    Slider(value: $green, in: 0...1)
                }
                VStack {
                    Text("blue")
                        .font(.caption)
                    Slider(value: $blue, in: 0...1)
                }
                
            }
        }
    }
}

struct Color1_Previews: PreviewProvider {
    static var previews: some View {
        Color1()
    }
}
