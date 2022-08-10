//
//  VideoView.swift
//  VideoPlayer
//
//  Created by zheng huang on 8/10/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    @State var video:Video
    var body: some View {
        GeometryReader{geo in
            VStack(alignment: .leading){
                Text(video.title).bold().font(.title).padding(.horizontal)
                
                VideoPlayer(player: AVPlayer(url: URL(string: video.url)!)).frame(height:1080/1920*geo.size.width).padding(.top)
            }
        }.navigationBarHidden(true)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: Video(id: 0, title: "dcdcmfkmfkvmfvk", url: "https://learn.codewithchris.com/courses/take/foundations/lessons/24709100-module-5-wrap-up-challenge"))
    }
}
