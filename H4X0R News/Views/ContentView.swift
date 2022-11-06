//
//  ContentView.swift
//  H4X0R News
//
//  Created by Apple on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - What is ObservedObject ?
    // it is going to trigger everytime whenver networkManager is going to update
   @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        VStack {
            //MARK: - Navigation View Q) What is navigation View?
            // It is used for navigate between the screeen it is easy to come back from the one screen to another or from second to root View
            NavigationView{
                List(networkManager.posts){ post in
                    //MARK: - Q)What is Navigation Link?
//                    this is used to trigger a navigation presentation of Detail View and label is what we want to show inside this link, in this case it is out HStack will be present inside this label 
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text("\(post.points)")
                            Text(post.title)
                        }
                    }
                }
                .navigationTitle("H4X04 NEWS")
            }
        }
        .padding()
        //MARK: - Q)What is onAppear?
        //it is just like viewDidLoad like uiKit it will call automatically when screen will appear
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//MARK: - Q)What is Identifiable?
// it used in our list order to like 1,2,3, and so on it is used with the structure and if we defined identifable then structure must contain id and if it doesnot contain then it will show the error.
//commented this because it using in PostdataModule
//struct Post:Identifiable {
//    let id:String
//    let title:String
//}
//let posts = [
//Post(id: "1", title: "Hello"),
//Post(id: "2", title: "Bonjour"),
//Post(id: "3", title: "Hola")
//]
