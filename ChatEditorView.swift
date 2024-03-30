import SwiftUI

struct ChatEditorView: View {
    @Binding var selectedQuestions: [String]
    @Binding var messages: [String]
    @Binding var selectedImage: UIImage?
    
    @State private var editableIndex: Int?

    
    var body: some View {
        ScrollView {
            VStack{
                if let image = selectedImage {
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
                ForEach(messages.indices, id: \.self) { index in
                    Group {
                        VStack{
                            Text(selectedQuestions[index])
                                .padding(12)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if editableIndex == index {
                                HStack{
                                    TextField("메시지를 입력하세요", text: $messages[index])
                                        .padding(12)
                                        .background(Color.white)
                                        .border(.black)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .onSubmit {
                                            editableIndex = nil // 사용자가 편집을 완료하면 다시 Text로 변경
                                        }
                                    Button(action: {
                                        editableIndex = nil
                                    }) {
                                        Text("완료")
                                    }
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .padding()
                                }
                                
                            } else {
                                Text(messages[index])
                                    .padding(12)
                                    .background(Color.white)
                                    .border(.black)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                        }
                        .contextMenu {
                            Button(action: {
                                editableIndex = index // 텍스트를 편집 가능하도록 수정 인덱스 설정
                            }) {
                                Text("답변 편집하기")
                            }
                            .padding()
                            Button(action: {
                                messages.remove(at: index) // 해당 텍스트 삭제
                            }) {
                                Text("삭제")
                            }
                            .padding()
                        }
                        
                    }
                }
            }
        }
        .padding()
            
        VStack{
            NavigationLink(destination: PostView(image: $selectedImage)) {
                Text("발행하기")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
            }
            .padding()
            .onAppear() {
                UserDefaults.standard.set(selectedQuestions, forKey: "userQuestions")
                UserDefaults.standard.set(messages, forKey: "userMessages")
            }
            .foregroundColor(.white)
            .padding(.bottom, 54)
        }
    }
}
