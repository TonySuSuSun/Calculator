//
//  BinaryView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//
import SwiftUI

struct BinaryView: View {
    let units = ["Binary (二進位)", "Octal (八進位)", "Decimal (十進位)", "Hexadecimal (十六進位)"]

    @State private var inputValue = ""
    @State private var fromUnitIndex = 2 // 預設從 Decimal
    @State private var toUnitIndex = 0   // 預設轉成 Binary

    var convertedValue: String? {
        let fromBase = base(for: fromUnitIndex)
        let toBase = base(for: toUnitIndex)

        // 嘗試將輸入從來源進位轉為十進位整數
        guard let intValue = Int(inputValue, radix: fromBase) else {
            return nil
        }

        // 將十進位整數轉為目標進位制的字串
        return String(intValue, radix: toBase).uppercased()
    }

    func base(for index: Int) -> Int {
        switch index {
        case 0: return 2     // Binary
        case 1: return 8     // Octal
        case 2: return 10    // Decimal
        case 3: return 16    // Hexadecimal
        default: return 10
        }
    }

    var body: some View {
        Form {
            Section(header: Text("輸入數值與進位制")) {
                TextField("請輸入數字", text: $inputValue)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.asciiCapable)

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
                    Text("\(result) (\(units[toUnitIndex]))")
                } else {
                    Text("轉換出的 \(units[toUnitIndex]) 數字")
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("進位制轉換器")
    }
}

