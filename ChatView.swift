import SwiftUI

struct ChatView: View {
    @State private var messages: [String] = []
    @State private var questions: [String] = ["그렇군요! 그때 어떤 감정이 들었나요?", "조금 더 자세히 말해주세요!", "여행에 돌아와서도 비슷한 경험을 한적이 있나요?"]
    @State private var selectedQuestions: [String] = ["이 사진에 대해 설명해주세요 🙋"]
    @State private var text: String = ""
    
    @FocusState var focused: Bool
    @State private var isVisible = false
    
    @Binding var selectedImage: UIImage? // 바인딩으로 받음
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                            .padding(8)
                        
                        VStack{
                            Text(selectedQuestions[0])
                                .padding(12)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    } else {
                        Text("No Image")
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    // 메시지와 질문을 번갈아가며 표시
                    ForEach(messages.indices, id: \.self) { index in
                        Group {
                            Text(messages[index])
                                .padding(12)
                                .background(Color.white)
                                .border(.black)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            Text(questions[index % questions.count])
                                .padding(12)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            //                                    .onAppear {
                            //                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            //                                            isVisible = true
                            //                                        }
                            //                                    }
                                .onAppear {
                                    self.selectedQuestions.append(self.questions[index % self.questions.count])
                                }
                        }
                    }
                }
            }
            .padding()
            
            VStack{
                HStack{
                    Button(action: {}) {
                        Text("🔄 다른 질문 해주세요")
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray5))
                    .foregroundColor(Color(.systemGray))
                    .font(.subheadline)
                    .cornerRadius(60)
                    
                    Button(action: {}) {
                        NavigationLink(
                            destination: ChatEditorView(
                                selectedQuestions: $selectedQuestions
                                ,messages: $messages, selectedImage: $selectedImage
                            ),
                            label: {Text("🙋 대화가 끝났어요")})
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray5))
                    .foregroundColor(Color(.systemGray))
                    .font(.subheadline)
                    .cornerRadius(60)
                }
            }
            
            VStack{
                HStack {
                    TextField("텍스트을 입력해주세요", text: $text)
                        .padding()
                        .focused($focused)
                    //                    .background(Color(.systemGray5))
                        .background(Color(.white))
                    Button(action: {
                        messages.append(text)
                        text = "" // 추가 후 텍스트 필드를 비웁니다.
                    }) {
                        Text("전송")
                    }
                    //                .padding(.trailing)
                    .disabled(text.isEmpty) // 텍스트가 비어있으면 전송 버튼을 비활성화합니다.
                    .background(Color.black)
                }
                .padding()
            }
        }
        .accentColor(.black)
    }
}



struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(selectedImage: .constant(nil))
    }
}

