import SwiftUI

struct VerticalPaging: View {
    @State var selection = 2
    var body: some View {
        GeometryReader { proxy in
            TabView(selection: $selection) {
                
                Group{
                    StatisticsView()
                        .tag(1)
                    ContentView()
                        .tag(2)
                }
                .rotationEffect(.degrees(-90)) // Rotate content
                .frame(
                    width: proxy.size.width + 30 ,
                    height: proxy.size.height
                )
            }
            .frame(
                width: proxy.size.height , // Height & width swap
                height: proxy.size.width
            )
            .rotationEffect(.degrees(90), anchor: .topLeading) // Rotate TabView
            .offset(x: proxy.size.width) // Offset back into screens bounds
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
        }
        .ignoresSafeArea()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalPaging()
.previewInterfaceOrientation(.portrait)
    }
}
