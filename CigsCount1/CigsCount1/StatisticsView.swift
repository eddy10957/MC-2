//
//  StatisticsView.swift
//  CigsCount1
//
//  Created by Edoardo Troianiello on 10/12/21.
//

import SwiftUI
let backgroundGradient = LinearGradient(colors: [.orange,Color( red: 221/255 , green: 226/255, blue: 228/255, opacity: 1)],startPoint: .init(x: 0.5 ,y: 0.8) , endPoint: .top)

struct StatisticsView: View {
    var body: some View {
       
        ZStack{
            
            backgroundGradient
                .ignoresSafeArea(.all)
            VStack{
                
                Picker(selection: .constant(3),label: Text("Picker")) {
                    Text("Day").tag(1)
                    Text("Month").tag(2)
                    Text("Year").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, 60.0)
                .padding()
                Spacer()
                
                VerticalChart()
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .font(.system(size: 70, weight: .semibold))
                    .shadow(color: .black, radius: 10, x: 0, y: -20)
                    .padding()
                    
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        
        
    }
}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}

