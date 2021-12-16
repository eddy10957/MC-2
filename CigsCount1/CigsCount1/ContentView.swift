//
//  ContentView.swift
//  CigsCount1
//
//  Created by Edoardo Troianiello on 10/12/21.
//



import SwiftUI
import Neumorphic



struct ContentView: View {
    
    @State var cigsCount: Int = 1
    @GestureState var isDetectingLongPress = false
    @State var doneCounting = false
    @State var blend:Bool = false
    @State var opacity = 0.0
    @State var showParticles = false
    
    
   
        
    
    
    var body: some View {
        
        
        ZStack{
            VStack{
                
                Spacer()
                
                ZStack{
                    CircularProgressBar(cigsCount: $cigsCount)
                        
                    if showParticles {
                        Circle()
                              .fill(.gray)
                              .modifier(ParticleEffect(count: 150, duration:  1.0))
                    }
                    
                }
                .onLongPressGesture(minimumDuration: 1, pressing: { _ in
                    showParticles.toggle()
                    }) {
                        showParticles=false
                        cigsCount += 1
                    }
                .ignoresSafeArea()
                
                
                Text("\(7 - cigsCount) cigarettes left")
                    .font(.system(size: 22 , weight: .bold))
                    .foregroundColor(Color( red: 212/255, green: 126/255, blue: 25/255, opacity: 1))
                    .padding()
                
               
                Spacer()
            }
            
            
            
            
            Image(systemName: "chevron.up")
                .font(.system(size: 70, weight: .semibold))
                .padding(.top, 35.0)
                .frame(maxHeight: .infinity, alignment: .top)
                .shadow(color: .black, radius: 15, x: 0, y: 10)
//                .shadow(color: .white, radius: 15, x: 0, y: -10)

            
        }
        
        .frame(maxWidth: .infinity)
        .background(.orange)
        
        }
}


    struct ParticleMotion: GeometryEffect {
        
        var time: Double = 2
        let v0: Double  = Double.random(in: 40...80) // initial speed
        let alpha: Double = Double.random(in: 0.0..<Double.pi) // throw angle
        let g = 15 * 9.81 // gravity
        
        var animatableData: Double {
            get { time }
            set { time = newValue }
        }
        
        func effectValue(size: CGSize) -> ProjectionTransform {
            
            let dx = v0*time*cos(alpha)
            let dy = v0*sin(alpha)*time - 0.5*(-g)*time*time
            
            let affineTransform = CGAffineTransform(translationX: CGFloat(dx), y: CGFloat(-dy))
            return ProjectionTransform(affineTransform)
        }
    }

    struct ParticleEffect: ViewModifier {
        
        let count: Int
        let duration: Double //= 2.0
        
        @State var time: Double = 0.0
        
        func body(content: Content) -> some View {
            let animation = Animation.linear(duration: duration)

            
            return ZStack {
                ForEach (0..<count)  { index in
                    
                    Circle()
                        .fill(.gray)
                        .hueRotation(Angle(degrees: 180.0))
                        .scaleEffect(CGFloat((duration-self.time)/duration))
                        .modifier(ParticleMotion(time: self.time))
                        .opacity((duration-self.time)/duration)
                        .animation(animation.delay(Double.random(in: 0..<self.duration)))
                        .blendMode(.color)
                        .frame(width: 30, height: 30)
                }
                
            }.onAppear(){
                withAnimation() {
                    self.time = self.duration
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}



