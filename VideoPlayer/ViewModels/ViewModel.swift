//
//  ViewModel.swift
//  VideoPlayer
//
//  Created by zheng huang on 8/10/22.
//

import Foundation

class ViewModel:ObservableObject{
    @Published var videos:[Video] = [Video]()
    @Published var result_video:[Video]?
    
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
                    DispatchQueue.main.async {
                        self.videos = data
                    }
                   
                }
                catch{
                    print(error)
                }
            }.resume()
        }
    }
    
    func searchBook(title:String){
        result_video = videos.filter { video in
            return video.title.contains(title)
        }
    }
    
}


