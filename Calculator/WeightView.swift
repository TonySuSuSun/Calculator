//
//  WeightView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//
import SwiftUI

struct WeightView: View {
    // 定義所有支援的單位與對應的轉換因子（以公克為基準）
    let units: [(name: String, factor: Double)] = [
        ("公克 (g)", 1.0),
        ("公斤 (kg)", 1000.0),
        ("公噸 (mt)", 1_000_000.0),
        ("盎司 (oz)", 28.3495),
        ("磅 (lb)", 453.592)
    ]
    
    @State private var inputValue = ""
    @State private var fromUnitIndex = 0   // 預設從公克開始
    @State private var toUnitIndex = 1     // 預設轉換成公斤

    // 計算轉換後的數值
    var convertedValue: Double? {
        guard let value = Double(inputValue) else { return nil }
        // 先轉換到基準單位（公克），再轉換到目標單位
        let valueInGrams = value * units[fromUnitIndex].factor
        return valueInGrams / units[toUnitIndex].factor
    }

    var body: some View {
        Form {
            Section(header: Text("輸入數值與單位")) {
                TextField("請輸入數字", text: $inputValue)
                    .keyboardType(.decimalPad)
                
                Picker("從", selection: $fromUnitIndex) {
                    ForEach(0..<units.count, id: \.self) { index in
                        Text(units[index].name)
                    }
                }
                
                Picker("轉換成", selection: $toUnitIndex) {
                    ForEach(0..<units.count, id: \.self) { index in
                        Text(units[index].name)
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
        .navigationTitle("重量轉換器")
    }
}

