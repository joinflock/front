import SwiftUI

struct FilledButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? Color.theme.grey : Color.theme.background)
            .padding()
            .background(Color.theme.accent)
            .cornerRadius(30)
        
    }
}

struct FilledButton_Previews: PreviewProvider {
    static var previews: some View {
        Button{
            
        } label: {
            Text("next")
                .font(.poppins(.semibold, size: 18))
                .frame(width: 321, height: 18)
        }
        .buttonStyle(FilledButton())
            
    }
}
