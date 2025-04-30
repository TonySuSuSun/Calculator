//
//  PowerView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//
import SwiftUI

struct PowerView: View {
    // 定義功率單位與其轉換為瓦特 (W) 的倍率
    let units: [(name: String, factor: Double)] = [
        ("瓦特 (W)", 1.0),
        ("千瓦 (kW)", 1_000.0),
        ("匹馬力 (hp)", 745.7),
        ("英制馬力 (ihp)", 745.7),
        ("公制馬力 (metric hp)", 735.5),
        ("毫瓦 (mW)", 0.001)
    ]
    
    @State private var inputValue = ""
    @State private var fromUnitIndex = 0  // 預設從 W
    @State private var toUnitIndex = 1    // 預設轉換成 kW

    // 計算轉換後數值
    var convertedValue: Double? {
        guard let value = Double(inputValue) else { return nil }
        let watts = value * units[fromUnitIndex].factor
        return watts / units[toUnitIndex].factor
    }

    var body: some View {
        Form {
            Section(header: Text("輸入數值與單位")) {
                TextField("請輸入數字", text: $inputValue)
                    .keyboardType(.decimalPad)
                
                Picker("從", selection: $fromUnitIndex) {
                    ForEach(0..<units.count, id: \.self) {
                        Text(units[$0].name)
                    }
                }

                Picker("轉換成", selection: $toUnitIndex) {
                    ForEach(0..<units.count, id: \.self) {
                        Text(units[$0].name)
                    }
                }
            }

            Section(header: Text("轉換結果")) {
                if let result = convertedValue {
                    Text("\(result, specifier: "%.6f") \(units[toUnitIndex].name)")
                } else {
                    Text("顯示轉換結果")
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("功率轉換器")
    }
}
