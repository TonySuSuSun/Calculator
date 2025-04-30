//
//  TemperatureView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//
import SwiftUI

struct TemperatureView: View {
    let units = ["攝氏 (°C)", "華氏 (°F)", "開爾文 (K)", "蘭金 (°R)"]

    @State private var inputValue = ""
    @State private var fromUnitIndex = 0  // 預設從攝氏
    @State private var toUnitIndex = 1    // 預設轉換成華氏

    // 轉換邏輯
    var convertedValue: Double? {
        guard let input = Double(inputValue) else { return nil }
        let celsius = toCelsius(value: input, from: fromUnitIndex)
        return fromCelsius(value: celsius, to: toUnitIndex)
    }

    // 將任意單位轉成攝氏
    func toCelsius(value: Double, from index: Int) -> Double {
        switch index {
        case 0: return value // 攝氏
        case 1: return (value - 32) * 5 / 9 // 華氏
        case 2: return value - 273.15 // 開爾文
        case 3: return (value - 491.67) * 5 / 9 // 蘭金
        default: return value
        }
    }

    // 從攝氏轉成任意單位
    func fromCelsius(value: Double, to index: Int) -> Double {
        switch index {
        case 0: return value // 攝氏
        case 1: return value * 9 / 5 + 32 // 華氏
        case 2: return value + 273.15 // 開爾文
        case 3: return (value + 273.15) * 9 / 5 // 蘭金
        default: return value
        }
    }

    var body: some View {
        Form {
            Section(header: Text("輸入數值與單位")) {
                TextField("請輸入溫度", text: $inputValue)
                    .keyboardType(.decimalPad)

                Picker("從", selection: $fromUnitIndex) {
                    ForEach(0..<units.count, id: \.self) {
                        Text(units[$0])
                    }
                }

                Picker("轉換成", selection: $toUnitIndex) {
                    ForEach(0..<units.count, id: \.self) {
                        Text(units[$0])
                    }
                }
            }

            Section(header: Text("轉換結果")) {
                if let result = convertedValue {
                    Text("\(result, specifier: "%.2f") \(units[toUnitIndex])")
                } else {
                    Text("顯示轉換結果")
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("溫度轉換器")
    }
}

