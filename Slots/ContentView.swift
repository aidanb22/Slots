//
//  ContentView.swift
//  Slots
//
//  Created by aidan b on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0,0,0,0,0,0,0,0,0]
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        
        ZStack{
            // Background
            Rectangle()
                .foregroundColor(Color(red: 150/255, green: 0/255, blue:255/255)).edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 0/255))
                .rotationEffect(Angle(degrees:45))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                Spacer()
                
                //Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                    
                    Text("Slots")
                        .font(Font.system(size: 46, weight: .bold))
                        .multilineTextAlignment(.center)
                        .overlay {
                            LinearGradient(
                                colors: [.white, .gray, .blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .mask(
                                Text("Slots")
                                    .font(Font.system(size: 46, weight: .bold))
                                    .multilineTextAlignment(.center)
                            )
                        }
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.blue)
                }.scaleEffect(2)
                
                
                Spacer()
                //Credits counter
                
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                //Cards
                HStack{
                    //copy and paste this twice to get the 3x3 array of slots
                    Spacer()
                    Image(symbols[numbers[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                    
                }
                HStack{
                    //copy and paste this twice to get the 3x3 array of slots
                    Spacer()
                    Image(symbols[numbers[3]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[4]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[5]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                    
                }
                HStack{
                    //copy and paste this twice to get the 3x3 array of slots
                    Spacer()
                    Image(symbols[numbers[6]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    
                    Image(symbols[numbers[7]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[numbers[8]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                
                
                //Button
                Button(action: {
                    //change the images
                    self.numbers[0] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[1] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[2] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[3] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[4] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[5] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[6] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[7] = Int.random(in: 0...self.symbols.count-1)
                    
                    self.numbers[8] = Int.random(in: 0...self.symbols.count-1)
                    
                    //check winnings
                    
                    //jackpot winning
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] && self.numbers[2] == self.numbers[3] && self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5] && self.numbers[5] ==  self.numbers[6] && self.numbers[6] == self.numbers[7] && self.numbers[7] == self.numbers[8] {
                        //all match
                        
                        self.credits += self.betAmount * 1000
                        
                    
                        
                    }
                    //small winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]{
                        self.credits += self.betAmount * 2
                    }
                    if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5]{
                        self.credits += self.betAmount * 2
                    }
                    if self.numbers[6] == self.numbers[7] && self.numbers[7] == self.numbers[8]{
                        self.credits += self.betAmount * 2
                    }
                    
                    //6 row winnings
                    
                    
                    
                    else{
                        self.credits -= self.betAmount
                    }
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(Color(.white))
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.blue)
                        .cornerRadius(20)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
