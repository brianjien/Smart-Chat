import SwiftUI

struct Home_ViewUI: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                HStack {
                    ButtonBlockView(text: "Hi, welcome to the Smart Chat App ", color: .blue, image: Image(systemName: "person"))
                        .multilineTextAlignment(.center)
                }
                HStack {
                    NavigationLink(destination: AccountSettingsView()) {
                        ButtonBlockView(text: "Personal information", color: .cyan, image: Image(systemName: "person.fill"))
                    }
                }
                HStack {
                    NavigationLink(destination: Friends_ViewUI()) {
                        ButtonBlockView(text: "Friends", color: .orange, image: Image(systemName: "person.2.fill"))
                    }
                    NavigationLink(destination: Setting_ViewUI()) {
                        ButtonBlockView(text: "Settings", color: .purple, image: Image(systemName: "gear"))
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
    let image: Image
    
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
