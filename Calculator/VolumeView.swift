//
//  VolumeView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//
import SwiftUI

struct VolumeView: View {
    let units: [(name: String, factor: Double)] = [
        ("立方公尺 (m³)", 1.0),
        ("公升 (L)", 0.001),
        ("毫升 (mL)", 0.000001),
        ("立方公分 (cm³)", 0.000001),
        ("立方英尺 (ft³)", 0.0283168),
        ("立方英吋 (in³)", 0.0000163871),
        ("加侖 (gal)", 0.00378541)
    ]
    
    @State private var inputValue = ""
    @State private var fromUnitIndex = 1  // 預設從公升
    @State private var toUnitIndex = 0    // 預設轉換成立方公尺

    var convertedValue: Double? {
        guard let input = Double(inputValue) else { return nil }
        let valueInCubicMeter = input * units[fromUnitIndex].factor
        return valueInCubicMeter / units[toUnitIndex].factor
    }

    var body: some View {
        Form {
            Section(header: Text("輸入數值與單位")) {
                TextField("請輸入體積", text: $inputValue)
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
        .navigationTitle("體積轉換器")
    }
}
