//
//  LengthView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//

import SwiftUI

struct LengthView: View {
    // 支援的單位與轉換因子（全部以公尺為基準）
    let units: [(name: String, factor: Double)] = [
        ("奈米 (nm)", 1e-9),
        ("公分 (cm)", 0.01),
        ("英寸 (in)", 0.0254),
        ("英尺 (ft)", 0.3048),
        ("碼 (yd)", 0.9144),
        ("公尺 (m)", 1.0),
        ("公里 (km)", 1000.0),
        ("英里 (mi)", 1609.34)
    ]
    
    @State private var inputValue = ""
    @State private var fromUnitIndex = 5 // 預設從公尺
    @State private var toUnitIndex = 0   // 預設轉換成奈米

    var convertedValue: Double? {
        guard let value = Double(inputValue) else { return nil }
        let valueInMeters = value * units[fromUnitIndex].factor
        return valueInMeters / units[toUnitIndex].factor
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
        .navigationTitle("長度轉換器")
    }
}
