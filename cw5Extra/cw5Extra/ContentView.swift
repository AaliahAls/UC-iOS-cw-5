//
//  ContentView.swift
//  cw5Extra
//
//  Created by khaled falah alazemi  on 14/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var weight = ""
    @State var length = ""
    @State var status = ""
    @State var bmi = 0.0
    var body: some View {
        VStack{
            Text("BMI Calculater")
                .bold()
                .foregroundColor(.purple)
                .font(.title)
    
            ZStack{
                Rectangle()
                            .frame(width: 200, height: 200, alignment: .center)
                            .foregroundColor(.gray)
                            .blur(radius: 70)
                Image("weight")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            } .padding()
            Text("ادخل الطول والوزن :")
                .bold()
                .foregroundColor(.purple)
                .font(.title3)
                .padding()
            TextField("ادخل الوزن هنا", text: $weight)
                .padding()
                .background(.white)
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 50)
                
            TextField("ادخل الطول هنا", text: $length)
                .padding()
                .background(.white)
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 50)
            
            Button(action: {
                bmi = BMI(weight: (Double(weight) ?? 0), length: (Double(length) ?? 0))
                if BMI(weight: (Double(weight) ?? 0), length: (Double(length) ?? 0)) <= 20.0 {
                    status = "ضعيف"
                } else if BMI(weight: (Double(weight) ?? 0), length: (Double(length) ?? 0)) <= 25.0 {
                    status = "جيد"
                } else {
                    status = "سمين"
                }
                
            }) {
                ZStack{
                    Capsule()
                        .frame(width: 150, height: 50, alignment: .center)
                        .foregroundColor(.purple)
                    Text("إحسب")
                        .font(.title)
                        .foregroundColor(.white)
                } .padding()
            }
            
            Text("BMI = \(String(format: "%.2f", bmi))")
            Text(status)
        }
    }
}
func BMI(weight: Double, length: Double) -> Double {
    let bmi = ( weight / (length * length) )
    return bmi
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
