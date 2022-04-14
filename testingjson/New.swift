//
//  New.swift
//  testingjson
//
//  Created by Jordyn Fulbright on 4/13/22.
//

import SwiftUI


struct new: View {

   
    @State var episodes = 0;
    @State var name = ""
    @State var note = ""
    @State var watched = ""
    @State var nameHolder = " "
    @State private var watchCount = 0;
    
    var watchCat = ["Watched", "Plan to watch", "Dropped","Currently Watching"]
    
    var body: some View {
        
        VStack {
            Rectangle().fill(Color("buttons"))
                .frame(width:360, height: 450)
                .opacity(0.5)
                .cornerRadius(10)
                .overlay (
            VStack {
                VStack {
                Text("Enter drama name")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("pinker"))
                    .font(.system(size: 30))
                    
                TextField("Enter drama name", text: $name)
                    .padding(.horizontal)
                    .frame(width: 300)
                    .border(Color.gray, width: 1)
                    
                }//vstack for getting name
                .padding()
                
                .background(Color.white)
                .cornerRadius(10)
                
                
                Picker(selection: $watched, label:
                        Text("why does this not work")) {
                    ForEach(0..<4) { //index in
                        Text(watchCat[$0])
                    }}
                        .onReceive(
                        [self.watchCount].publisher.first()){
                            (value) in
                            watched = watchCat[watchCount]
                        }
                        .padding()
                        
                
                
                
                HStack(){        Stepper(onIncrement: {
                    self.episodes += 1
                    
                },
                                         onDecrement: {
                    self.episodes -= 1
                    
                }
                ) {
                    Text("Episodes:  \(episodes)")
                }
                }//hstack
                .frame(width:300)
                
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                VStack {
                
                Text("Notes")
                    .foregroundColor(Color("pinker"))
                   
                
                TextField("Enter any notes about the drama", text: $note)
                        .padding()
                        .border(Color.gray, width: 1)
                }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(width: 330)
                
                Rectangle().fill(Color("pinker"))
                    .frame(width: 90, height: 55)
                    .cornerRadius(10)
                    .overlay (
                Button(action:{
                    if (name == " ") {
                        self.nameHolder = "Cannot submit without drama name."
                    }
                    else {
                        
                        dramaC.add(title: name, watch: watched, epi: episodes, note: note)
                        dramaC.save()
                        self.watched = " "
                        self.episodes = 0
                        self.note = " "
                        self.name = " "
                        self.nameHolder = " "
                    }
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                }
                )
            }//vstack
                .frame(width:360, height: 450)
            )
            Text(self.nameHolder)
        }//zstack
        
        
        
        
        
        
    }//var body
}

struct new_Previews: PreviewProvider {
    static var previews: some View {
        new()
    }
}

