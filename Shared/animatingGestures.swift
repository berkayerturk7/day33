import SwiftUI

struct animatingGestures: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        
        LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 200, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .offset(dragAmount)
            //offset direkt CGSize alabilir.
            //şeklin merkezini 0'a bağladık.
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    //hareket ettiğinde dragAmountun değeri kullanıcının o anki konumu olsun.
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            dragAmount = .zero
                            // aşağıdaki yerine, bıraktığımızda animasyon olsun.
                        }
                      
                        
                    }
                    //parmagımızı bıraktığımızda dragAmountun değeri sıfır olsun.
            )
            //.animation(.default, value: dragAmount) -> cisim animasyonlu(biraz da yavas) hareket eder ekranda.
        
        
    }
}

struct animatingGestures_Previews: PreviewProvider {
    static var previews: some View {
        animatingGestures()
    }
}
