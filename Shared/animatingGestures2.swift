
import SwiftUI

struct animatingGestures2: View {
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    let letters = Array("Day 33 Done ✅")
    
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                            Text(String(letters[num]))
                                .padding(5)
                                .font(.title)
                                .background(enabled ? .blue : .red)
                                .offset(dragAmount)
                                .animation(.default.delay(Double(num) / 20), value: dragAmount)
                                // ilk elemanda gecikme yok, diğerlerinde artarak
            }
        }.gesture(
        DragGesture()
        .onChanged{dragAmount = $0.translation}
        .onEnded{ _ in
            dragAmount = .zero
            enabled.toggle()
        }
        )
    }
}

struct animatingGestures2_Previews: PreviewProvider {
    static var previews: some View {
        animatingGestures2()
    }
}
