//
//  AreaView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//
import SwiftUI

struct AreaView: View {
    let units: [(name: String, factor: Double)] = [
        ("平方公尺 (m²)", 1.0),
        ("平方公里 (km²)", 1_000_000.0),
        ("公畝 (a)", 100.0),
        ("公頃 (ha)", 10_000.0),
        ("平方公分 (cm²)", 0.0001),
        ("平方毫米 (mm²)", 0.000001),
        ("平方英尺 (ft²)", 0.092903),
        ("平方英吋 (in²)", 0.00064516),
        ("英畝 (acre)", 4046.86)
    ]

    @State private var inputValue = ""
    @State private var fromUnitIndex = 0  // 預設從平方公尺
    @State private var toUnitIndex = 1    // 預設轉換成平方公里

    var convertedValue: Double? {
        guard let input = Double(inputValue) else { return nil }
        let valueInSquareMeters = input * units[fromUnitIndex].factor
        return valueInSquareMeters / units[toUnitIndex].factor
    }

    var body: some View {
        Form {
            Section(header: Text("輸入數值與單位")) {
                TextField("請輸入面積", text: $inputValue)
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
        .navigationTitle("面積轉換器")
    }
}
