//
//  ContentView.swift
//  testingjson
//
//  Created by Jordyn Fulbright on 4/13/22.
//
import SwiftUI

var nav = false
struct ContentView: View {
    
    @State private var animationAmount = 1.0

    var body: some View {
        
        VStack {
            
            Text("Drama App")
                .font(.custom("Futura-MediumItalic", size: 25))
                .padding(.top)
                .scaleEffect(animationAmount)
                        .opacity(-1 + animationAmount)
                        .animation(
                            .easeIn(duration: 2)
                                ,
                            value: animationAmount
                        )
                        .onAppear {
                            animationAmount = 2
                        }
            
            
            NavigationView {
                VStack (spacing:15) {
                    Text("Where you can store all of your watched dramas!")
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.custom("Futura-MediumItalic", size: 25))
                        .foregroundColor(Color("buttons"))
                        .offset(x:0,y:-100)
                    NavigationLink(destination: Submit()) {
                        Rectangle().fill(Color("buttons"))
                            .frame(width: 250, height: 80)
                            .cornerRadius(10)
                            .overlay (
                                Text("Dramas")
                                    .foregroundColor(.white)
                                    .font(.title)
                            )
                    }
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(nav)
                    NavigationLink(destination: new()) {
                        Rectangle().fill(Color("buttons"))
                            .frame(width: 250, height: 80)
                            .cornerRadius(10)
                            .overlay (
                                Text("Submit Drama")
                                    .foregroundColor(.white)
                                    .font(.title)
                            )
                    }
                    .navigationBarTitle("", displayMode: .inline)
                    
                    
                }//VStack 2
            }//nav view
            
            
        }//VStack 1
        .overlay (
            Circle()
                .overlay (
                Text("Drama App")
                    .font(.custom("Futura-MediumItalic", size: 45))
                
                )
            .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                            ,
                        value: animationAmount
                    )
                    .onAppear {
                        animationAmount = 2
                    }
                
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Show: Identifiable, Decodable, Encodable {
    
    var id = UUID()
    var title: String
    var episodes: Int
    var watch: String
    var note: String
    
}
