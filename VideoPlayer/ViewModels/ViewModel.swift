//
//  ViewModel.swift
//  VideoPlayer
//
//  Created by zheng huang on 8/10/22.
//

import Foundation

class ViewModel:ObservableObject{
    @Published var videos:[Video] = [Video]()
    
    init(){
        getRemoteData()
    }
    
    func getRemoteData(){
        let url = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json")
        
        if url != nil{
            let request = URLRequest(url: url!)
            let session = URLSession.shared
            session.dataTask(with: request) { data, response, error in
                
                guard error == nil else{
                    return
                }
                
                let decoder = JSONDecoder()
                do{
                    
                    let data = try decoder.decode([Video].self, from: data!)
                    self.videos = data
                }
                catch{
                    print(error)
                }
            }.resume()
        }
    }
    
}


