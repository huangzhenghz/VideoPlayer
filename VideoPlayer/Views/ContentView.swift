//
//  ContentView.swift
//  VideoPlayer
//
//  Created by zheng huang on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var videos:ViewModel
    var body: some View {
        NavigationView{
            List(videos.videos){i in
                NavigationLink(destination: {
                    VideoView().onAppear(perform: {
                        
                    })
                }, label: {
                    Text(videos.videos[0].title).padding(.vertical,5)
                })

            }.navigationTitle("All video")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
