//
//  SpeedView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//
import SwiftUI

struct SpeedView: View {
    // 支援的速度單位與轉換因子（以公尺每秒為基準）
    let units: [(name: String, factor: Double)] = [
        ("公分/秒 (cm/s)", 0.01),
        ("公尺/秒 (m/s)", 1.0),
        ("公尺/分 (m/min)", 1.0 / 60),
        ("公里/時 (km/h)", 1000.0 / 3600)
    ]
    
    @State private var inputValue = ""
    @State private var fromUnitIndex = 1  // 預設為 m/s
    @State private var toUnitIndex = 3    // 預設為 km/h

    // 計算轉換值
    var convertedValue: Double? {
        guard let value = Double(inputValue) else { return nil }
        let valueInMetersPerSecond = value * units[fromUnitIndex].factor
        return valueInMetersPerSecond / units[toUnitIndex].factor
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
        .navigationTitle("速度轉換器")
    }
}
