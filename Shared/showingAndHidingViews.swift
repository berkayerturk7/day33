
import SwiftUI

struct showingAndHidingViews: View {
    
    @State private var isShowingRed = false
    @State private var isDefaultHeading = true
    
    var body: some View {
        
        
        VStack {
            Button(isDefaultHeading ? "Tap Me!" : "Nice!"){
                withAnimation(.default){
                    isShowingRed.toggle()
                    isDefaultHeading.toggle()
                }
                
            }
            
            if isShowingRed {
            Rectangle()
               
                .fill(.red)
                .frame(width: 200, height: 200)
                .cornerRadius(50.5)
                //.transition(.scale)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                
            }
        }
        
        
        
    }
}

struct showingAndHidingViews_Previews: PreviewProvider {
    static var previews: some View {
        showingAndHidingViews()
    }
}
