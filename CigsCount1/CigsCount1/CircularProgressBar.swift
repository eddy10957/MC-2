//
//  CircularProgressBar.swift
//  CigsCount1
//
//  Created by Edoardo Troianiello on 10/12/21.
//
import SwiftUI
import Neumorphic

struct CircularProgressBar: View {
    

    @Binding var cigsCount : Int
    var body: some View {
        
        let mainColor = Color.Neumorphic.main
        
        ZStack {
            
            
            Circle().fill(Color( red: 212/255, green: 126/255, blue: 25/255, opacity: 1))
                .softInnerShadow(Circle(), spread: 0.1)
            Circle()
                .trim(from: 0.0, to: CGFloat(min((Double(cigsCount) / 7), 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 40.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: 270.0))
                .frame(width: 160, height: 160)
//                .softInnerShadow(Circle(), spread: 0.001)
            
            Circle().fill(.orange).frame(width: 120, height:120)
                .softOuterShadow(offset: 6, radius: 6)
            
//            Circle()
//                .stroke(lineWidth: 15.0)
//                .opacity(0.5)
//                .foregroundColor(.primary)
            
            
//                .softOuterShadow(offset: 2, radius: 2)
                

//            Text(String(format: "%X %", min(0.35, 1.0)*100.0))
//                .font(.system(size: 48))
//                .bold()
            Text("\(cigsCount)")
                .font(.system(size: 48))
                .bold()
        }
        .frame(width: 200, height: 200, alignment: .center)
        .environment(\.colorScheme, .dark)
//        .padding(100)
    }
}


//struct CircularProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CircularProgressBar()
//    }
//}
