import SwiftUI

struct OutlinedButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? Color.theme.grey : Color.theme.accent)
            .padding()
            .background(Color.theme.background)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.theme.accent, lineWidth: 2)
            )
                    
        
    }
}

struct OutlinedButton_Previews: PreviewProvider {
    static var previews: some View {
        Button{
            
        } label: {
            Text("next")
                .font(.poppins(.semibold, size: 18))
                .frame(width: 321, height: 18)
        }
        .buttonStyle(OutlinedButton())
            
    }
}
