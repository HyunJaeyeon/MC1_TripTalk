import SwiftUI

struct PostView: View {
    
    @State var userQuestion: [String] = []
    @State var userMessages: [String] = []
    
    @Binding var image: UIImage?
    
    var body: some View {
        VStack{
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .padding(8)
            } else {
                Text("No Image")
            }
        }
        
        VStack(alignment: .leading, spacing: 10) {
            // 메시지와 질문을 번갈아가며 표시            
            ForEach(userMessages.indices, id: \.self) { index in
                Group {
                    VStack{
                        Text(userQuestion[index])
                            .padding(12)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Text(userMessages[index])
                                .padding(12)
                                .background(Color.white)
                                .border(.black)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }                    
                }
            }
        .padding()
        .onAppear(){
            if let loadedQuestions = UserDefaults.standard.array(forKey: "userQuestions") as? [String] {
                self.userQuestion = loadedQuestions
            }
            if let loadedMessages = UserDefaults.standard.array(forKey: "userMessages") as? [String] {
                self.userMessages = loadedMessages
            }
            print("userQuestions: \(userQuestion)")
            print("userMessages: \(userMessages)")
        }
  }
}
