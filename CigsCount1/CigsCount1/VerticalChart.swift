import SwiftUI
import Neumorphic

struct VerticalChart: View {

  func monthAbbreviationFromInt(_ month: Int) -> String {
      switch month {
      case 1 :
          return "Jan"
      case 2 :
          return "Feb"
      case 3 :
          return "Mar"
      case 4 :
          return "Apr"
      case 5 :
          return "May"
      case 6 :
          return "Jun"
      case 7 :
          return "Jul"
      case 8 :
          return "Aug"
      case 9 :
          return "Sept"
      case 10 :
          return "Oct"
      case 11 :
          return "Nov"
      case 12 :
          return "Dic"
      default:
          return "porco dio"
      }
  }

  var body: some View {

    HStack {

        ForEach(datas) { datas in

        VStack {

          Spacer()
            Text("\(datas.smokedCigs)")
            .font(.footnote)
            .rotationEffect(.degrees(-90))
            .offset(y: Double(datas.smokedCigs) < 2.4 ? 0 : 35)
            .zIndex(1)
            .foregroundColor(.white)

            
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 20).fill(Color( red: 212/255, green: 126/255, blue: 25/255, opacity: 1))
                    .softInnerShadow(RoundedRectangle(cornerRadius: 20), darkShadow: .black, lightShadow: .orange, spread: 0.3, radius: 2)
                            .frame(width: 20, height:150)
                            
                RoundedRectangle(cornerRadius: 20).fill(.black)
                                .frame(width: 20, height:CGFloat(datas.smokedCigs) * 2.0)
                        }

            Text("\(self.monthAbbreviationFromInt(datas.month))")
            .font(.footnote)
            .frame(height: 20)
        }
      }
    }
    .frame(minWidth: 0, maxHeight: 200)
  }
    
    
    var datas : [Data] = [
       Data(smokedCigs: 22, month: 1),
       Data(smokedCigs: 35, month: 2),
       Data(smokedCigs: 44, month: 3),
       Data(smokedCigs: 66, month: 4),
       Data(smokedCigs: 11, month: 5),
       Data(smokedCigs: 22, month: 6),
       Data(smokedCigs: 44, month: 7),
       Data(smokedCigs: 22, month: 8),
       Data(smokedCigs: 66, month: 9),
       Data(smokedCigs: 22, month: 10),
       Data(smokedCigs: 22, month: 11),
       Data(smokedCigs: 11, month: 12)
   ]
}

 

struct PrecipitationChart_Previews: PreviewProvider {
  static var previews: some View {
      VerticalChart()
  }
}
