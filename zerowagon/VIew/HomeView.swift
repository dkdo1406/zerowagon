//
//  HomeView.swift
//  zerowagon
//
//  Created by Hyeongjung on 2022/06/23.
//

import SwiftUI

struct HomeView: View {
    let category = ["제로펩시", "제로콜라"]
    let colaCapacity = ["190", "355"]
    let pepsiCapacity = ["210", "355", "500"]
    @State var selected = ""
    @State var selectedCategory = "종류를 선택해 주세요"
    @State var selectedCapacity = "210"
    @State var amount = ""
    @State var price = ""
    @State var EA = 0
    @State var weight = 0
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Picker("", selection: $selectedCategory) {
                    ForEach(category, id: \.self) { i in
                        Text(i)
                        
                    }
                }
                .pickerStyle(.segmented)
            }
            HStack {
                Picker("", selection: $selectedCapacity) {
                    ForEach(colaCapacity, id: \.self) { i in
                        Text(i)
                    }
                }
                Text("ml")
            }
            HStack {
                TextField("수량", text: $amount)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100, height: 20, alignment: .center)
                Text("개")
            }
            HStack {
                TextField("가격", text: $price)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100, height: 20, alignment: .center)
                Text("원")
            }
            
            Button {
                pricePerPiece()
                totalWeight()
            } label: {
                Text("계산")
            }
            
            //보여줄 것 : 총 중량, 가격, 딜 정보
            HStack {
                Text("총 중량 :")
                Text("\(weight)")
                Text("ml")
            }
            HStack {
                Text("개당 가격")
                Text("\(EA)")
                Text("원")
            }
            Text("딜정보")
        }
    }
    
    func pricePerPiece() {
        guard let priceData = Int(price) else {
            return
        }
        guard let CapacityData = Int(selectedCapacity) else {
            return
        }
        EA = priceData / CapacityData
    }
    
    func totalWeight() {
        weight = (Int(selectedCapacity) ?? 0) * (Int(amount) ?? 0)
    }

}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
