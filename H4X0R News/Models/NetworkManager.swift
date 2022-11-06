//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Apple on 24/10/22.
//

import Foundation

//MARK: - What is ObservableObject ?
// it is used to broadcast one of the it's properties to any interested parties
class NetworkManager:ObservableObject {
    //MARK: - Q)What is published?
    // it is used to published the properties  to the interested parties 
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try  decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
