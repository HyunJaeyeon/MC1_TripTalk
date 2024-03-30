import SwiftUI

struct ContentView: View {
    @State private var isChatStartViewPresented = false
    
    var body: some View {
        TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                Button("글 쓰러가기") {
                    isChatStartViewPresented.toggle()
                }
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                }
                UserView()
                    .tabItem {
                        Image(systemName: "person")
                    }
        }
        .fullScreenCover(isPresented: $isChatStartViewPresented) {
            ChatStartView()
        }        
    }
}
