//
//  ContentView.swift
//  911 turbo history
//
//  Created by Райымбек Омаров on 04.06.2024.
import SwiftUI
struct ContentView: View {
    @GestureState private var swipeOffset: CGFloat = 0
    @State private var num: Int = 1 // Use @State to make num mutable
    @State private var dragOffset: CGFloat = 0
    
    let aboveTexts = [
        "1975 911 Turbo 3.0",
        "1978 911 Turbo 3.3",
        "1991 911 Turbo Gen.964",
        "1995 911 Turbo Gen.993",
        "2001 911 Turbo Gen.996",
        "2006 911 Turbo Gen.997",
        "2013 911 Turbo Gen.991",
        "2019 911 Turbo Gen.992"
    ]
    
    let belowTexts = [
        "191 kW (260 PS)\n5.5s",
        "221 kW (300 PS)\n5.4s",
        "235 kW (320 PS)\n5.0s",
        "300 kW (408 PS)\n4.5s",
        "309 KW (420 PS)\n4.2s",
        "353 kW (480 PS)\n3.9s",
        "383 kW (520 PS)\n3.2s",
        "478 kw (650 PS)\n2.4s"
    ]

    var body: some View {
        NavigationView {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Text(aboveTexts[num - 1])
                        .foregroundColor(.white)
                        .font(.custom("Nexa Bold", size: 50))// Adjust the font size here
                        .multilineTextAlignment(.center)
                    Spacer()
                    HStack {
                        Spacer() // Add a spacer on the left
                        Image("image\(num)")
                            .resizable()
                            .scaledToFit()
                            .offset(x: dragOffset + swipeOffset)
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                .onChanged { value in
                                    self.dragOffset = value.translation.width
                                }
                                .onEnded { value in
                                    withAnimation {
                                        if num != 8 {
                                            if value.translation.width < 0 {
                                                num += 1
                                            }
                                        }
                                        if num != 1 {
                                            if value.translation.width > 0 {
                                                num -= 1
                                            }
                                        }
                                        dragOffset = 0
                                    }
                                })
                        Spacer() // Add a spacer on the right
                    }
                    Spacer()
                    Text(belowTexts[num - 1])
                        .foregroundColor(.white)
                        .font(.system(size: 25)) // Adjust the font size here
                        .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("Image \(num)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
