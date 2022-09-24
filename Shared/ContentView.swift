

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                enabled.toggle()
            }
            .background(enabled ? .red : .gray)
            .frame(width: 200, height: 200)
            .foregroundColor(.white)
            .animation(.default, value: enabled)
            
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(nil, value: enabled) // bir üstteki renk değişimi hemen olsun
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
            // bu hemen olmasın
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
