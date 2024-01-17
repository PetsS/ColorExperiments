//
//  ContentView.swift
//  project9_challenge1
//
//  Created by Peter Szots on 13/06/2022.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var xTop: Double
    var yTop: Double
    var xBot: Double
    var yBot: Double
    
    var color1: Color
    var color2: Color
      
    var body: some View {
        
        let unitTop = UnitPoint(x: xTop, y: yTop)
        let unitBottom = UnitPoint(x: xBot, y: yBot)
        
        ZStack {
            Rectangle()
                LinearGradient(
                    gradient: Gradient(colors: [color1, color2]),
                    startPoint: unitTop,
                    endPoint: unitBottom
                )
        }
    }
}

struct ContentView: View {
    @State private var xTop = 0.0
    @State private var yTop = 0.0
    @State private var xBot = 1.0
    @State private var yBot = 1.0
    
    @State private var sheetShow = false
    
    var colors = ["Red", "Green", "Blue", "White"]
    @State private var selectedColor = "Red"
    @State private var selectedColor2 = "Green"
    
    let randomRed = Double.random(in: 0.8...1.0)
    let randomGreen = Double.random(in: 0.8...1.0)
    let randomBlue = Double.random(in: 0.8...1.0)
    
    var colorSelector: Color {
        let color: Color
        
        if selectedColor == "Red" {
            color = Color(red: randomRed, green: 0.1, blue: 0.1)
        } else if selectedColor == "Green" {
            color = Color(red: 0.1, green: randomGreen, blue: 0.1)
        } else if selectedColor == "Blue" {
            color = Color(red: 0.1, green: 0.1, blue: randomBlue)
        } else {
            color = Color(red: 1.0, green: 1.0, blue: 1.0)
        }
        return color
    }
    
    var colorSelector2: Color {
        let color: Color
        
        if selectedColor2 == "Red" {
            color = Color(red: randomRed, green: 0.1, blue: 0.1)
        } else if selectedColor2 == "Green" {
            color = Color(red: 0.1, green: randomGreen, blue: 0.1)
        } else if selectedColor2 == "Blue" {
            color = Color(red: 0.1, green: 0.1, blue: randomBlue)
        } else {
            color = Color(red: 1.0, green: 1.0, blue: 1.0)
        }
        return color
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    ColorCyclingRectangle(xTop: xTop, yTop: yTop, xBot: xBot, yBot: yBot, color1: colorSelector, color2: colorSelector2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(.thickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(20)
                    
                    HStack {
                        Picker("select a color", selection: $selectedColor) {
                            ForEach(colors, id: \.self) { color in
                                Text("\(color)")
                            }
                        }

                        .frame(width:30, height:30)
                        .padding(.horizontal, 16)
                        .border(colorSelector)
                        .pickerStyle(.automatic)
                        .background(colorSelector)
                        .padding(.horizontal, 50)
                        
                        
                        Spacer()
                        
                        Picker("select another color", selection: $selectedColor2) {
                            ForEach(colors, id: \.self) { color in
                                Text("\(color)")
                            }
                        }
                        .frame(width:30, height:30)
                        .padding(.horizontal, 16)
                        .border(colorSelector2)
                        .pickerStyle(.automatic)
                        .background(colorSelector2)
                        .padding(.horizontal, 50)
                    }
                }
                
                Group {
                    Text("x Top")
                        .font(.caption)
                    Slider(value: $xTop, in: 0.0...1.0)
                        .padding(.horizontal, 20)
                    
                    Text("y Top")
                        .font(.caption)
                    Slider(value: $yTop, in: 0.0...1.0)
                        .padding(.horizontal, 20)
                    
                    Text("x Bot")
                        .font(.caption)
                    Slider(value: $xBot, in: 0.0...1.0)
                        .padding(.horizontal, 20)
                    
                    Text("y Bot")
                        .font(.caption)
                    Slider(value: $yBot, in: 0.0...1.0)
                        .padding(.horizontal, 20)
                    
                    Button {
                       sheetShow = true
                    } label: {
                        Image(systemName: "arrow.up.square")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .padding()
                    }
                }
                
                

            }
            .navigationTitle("pApprika")
            .toolbar {
                NavigationLink{
                    ArrowView()
                } label: {
                    Text("go to arrow")
                    Image(systemName: "arrow.right")
                }
            }
            .sheet(isPresented: $sheetShow) {
                ArrowView()
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
