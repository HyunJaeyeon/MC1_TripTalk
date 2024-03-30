import SwiftUI

struct ChatStartView: View {
    var body: some View {   
            NavigationStack{
                VStack{ 
                    HStack{
                        Text("우리 대화하면서 기록을 시작해볼까요?")
                            .font(.system(size:27, weight: .medium))
                            .lineSpacing(6)
                        Spacer()
                    }
                    .padding(.top, 70)
                    
                    Spacer()
                    
                    Button(action: {
                      print("hi")
                    }){
                        NavigationLink(
                            destination: ImageSelectView(),
                            label: {Text("기록 시작하기")})
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .padding(.bottom, 54)
                    .font(.system(size: 17, weight: .semibold))
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: "xmark")
                        }
                        .font(.system(size: 20,weight: .regular))
                        .foregroundColor(.black)
                        .padding(.top, 20)
                    }
                }
                .padding(30)
            } 
        .accentColor(.black)
    }
}
