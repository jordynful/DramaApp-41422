//
//  Submit.swift
//  testingjson
//
//  Created by Jordyn Fulbright on 4/13/22.
//

import SwiftUI
var dramaC = dramas()
struct Submit: View {
    @State var showDetailView = false
    
    var body: some View {
        NavigationView {
            
            List(dramaC.list) { drama in
                NavigationLink(destination: detailView(drama: drama)) {
                    Text(drama.title)
                }
            }
            .navigationBarTitle("Your Drama List", displayMode: .inline)
        }
    }
    init() {
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("pinker")), .font: UIFont(name: "Futura-MediumItalic", size: 35)!]
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("pinker")), .
    font: UIFont(name: "Futura-MediumItalic", size: 20)!]
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance =  navBarAppearance
    UINavigationBar.appearance().compactAppearance = navBarAppearance
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.up.backward.circle.fill"),
        transitionMaskImage: UIImage(systemName: "arrow.up.backward.circle.fill"))
        UINavigationBar.appearance().tintColor = UIColor(Color("pinker"))
    }
}
struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}

struct detailView: View {

    var drama: Show
    var body: some View {
        VStack {
            Text(drama.title)
                .multilineTextAlignment(.center)
                .font(.custom("Futura-MediumItalic", size: 40))
                .padding()
                .foregroundColor(Color("buttons"))
                .offset(x:0, y: -40)
                
            VStack {
            Text(drama.watch)
                .fontWeight(.ultraLight)
                .foregroundColor(.gray)
                .italic()
                .offset(x:0, y: -40)
            
            RoundedRectangle(cornerRadius:10).fill(Color("pinker"))
                .frame(width: 170, height: 30)
                .overlay (
                    Text("Episodes watched: \(drama.episodes)")
                        .font(.custom("Futura-MediumItalic", size: 15))
                        .foregroundColor(.white)
                    
                )
                .padding()
                
            
            
            
            
            Rectangle().fill(Color("buttons"))
                .frame(width:300, height: 300)
                .cornerRadius(10)
                .overlay (
                    VStack {
                        Text("Notes:")
                            .offset(x:-100, y: -115)
                            .font(.custom("Futura-MediumItalic", size: 25))
                        Text(drama.note)
                            .font(.custom("Futura-MediumItalic", size: 20))
                    }
                        .foregroundColor(.white)
                )
            }
            
        }
        
    }
        
}

class dramas {
    var list: [Show] = []
    var length = 0
    init () {
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
                if let decoded = try? JSONDecoder().decode([Show].self, from: data) {
                    list = decoded
                    return
                }
            length = list.count
            }
        
        else {

            list = []
        }
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(list) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
        func add(title: String, watch: String, epi: Int, note: String) {
            
            list.insert(Show(title: title, episodes: epi, watch: watch, note: note), at: length)
            
            length+=1
            
        }


}

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        
        detailView(drama: Show(title: "A river runs through", episodes: 20, watch: "Plan to Watch", note: "Seems cool!"))
    }
}
