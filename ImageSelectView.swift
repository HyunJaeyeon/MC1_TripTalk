import SwiftUI

struct ImageSelectView: View {
    
    @State private var selectedUIImage: UIImage?
    
    var body: some View {        
        NavigationStack{
            VStack{ 
                HStack{
                    Text("오늘의 사진을 골라주세요")
                        .font(.system(size:27, weight: .medium))
                        .lineSpacing(6)
                    Spacer()
                }

                 Spacer()
                
                 ImagePickerView(selectedUIImage: $selectedUIImage)
                
                Spacer()
                
                Button(action: {

                }){
                    NavigationLink(
                        destination: ChatView(selectedImage: $selectedUIImage),
                        label: {Text("대화하기")})
                }
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .padding(.bottom, 54)
                .font(.system(size: 17,weight: .semibold))
            }
            .padding(30)
        } 
    .accentColor(.black)
    }
}
