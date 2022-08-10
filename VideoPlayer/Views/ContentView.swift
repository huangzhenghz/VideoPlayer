//
//  ContentView.swift
//  VideoPlayer
//
//  Created by zheng huang on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var videos:ViewModel
    @State var text:String = ""
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                TextField("Search video", text: $text) .textFieldStyle(.roundedBorder).padding()
                
                if videos.result_video == nil || text == ""{
                    List(videos.videos){i in
                        NavigationLink(destination: {
                            VideoView(video: i)
                        }, label: {
                            Text(i.title).padding(.vertical,5)
                        })
                    }
                }
                else{
                    List(videos.result_video!){i in
                        NavigationLink(destination: {
                            VideoView(video: i)
                        }, label: {
                            Text(i.title).padding(.vertical,5)
                        })
                    }
                }
                
            }.navigationTitle("All video")
                .onChange(of: text) { value in
                    videos.searchBook(title: value)
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
