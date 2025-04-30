//
//  AddView.swift
//  Calculator
//
//  Created by 蘇炫瑋 on 2025/4/16.
//

import SwiftUI

struct AddView: View {
    let functions = [
        ("匯率", "dollarsign.circle"),
        ("長度", "ruler"),
        ("面積", "square.grid.2x2"),
        ("體積", "cube.box"),
        ("重量", "scalemass"),
        ("溫度", "thermometer"),
        ("速度", "speedometer"),
        ("進位制", "number"),
        ("功率", "bolt.fill")
    ]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<functions.count, id: \.self) { index in
                        NavigationLink(destination: destinationView(for: index)) {
                            VStack {
                                Image(systemName: functions[index].1)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .padding(.bottom, 8)
                                Text(functions[index].0)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("轉換工具")
        }
    }

    @ViewBuilder
    func destinationView(for index: Int) -> some View {
        switch index {
        case 0: ExchangeRateView()//匯率
        case 1: LengthView()//長度
        case 2: AreaView()//面積
        case 3: VolumeView()//體積
        case 4: WeightView()//重量
        case 5: TemperatureView()//溫度
        case 6: SpeedView()//速度
        case 7: BinaryView()//進位制
        case 8: PowerView()//功率
        default: Text("未知頁面")
        }
    }
}


