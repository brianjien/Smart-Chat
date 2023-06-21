import SwiftUI

struct Home_ViewUI: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
             
                HStack{
                 
                        ButtonBlockView(text: "Hi, welcome to the Smart Chat App ", color: .blue)
                        .multilineTextAlignment(.center)

                 
                }
                HStack{
                    NavigationLink(destination: AccountSettingsView()){
                        ButtonBlockView(text: "Personal information", color: .cyan)
                    }
                }
                HStack{
                    NavigationLink(destination: Friends_ViewUI()) {
                        ButtonBlockView(text: "Friends", color: .orange)
                    }
                    
                    NavigationLink(destination: Setting_ViewUI()) {
                        ButtonBlockView(text: "Settings", color: .purple)
                    }
                    
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ButtonBlockView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(color)
            .cornerRadius(10)
            .bold()
        
    }
}

struct Home_ViewUI_Previews: PreviewProvider {
    static var previews: some View {
        Home_ViewUI()
    }
}
