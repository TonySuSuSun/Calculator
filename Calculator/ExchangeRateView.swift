//
//  ExchangeRateView.swift
//  Calculator
//
//  Created by Mac on 2025/4/30.
//
import SwiftUI

struct ExchangeRateView: View {
    let currencies = [
        "TWD (新台幣)", "USD (美元)", "EUR (歐元)", "JPY (日圓)", "GBP (英鎊)",
        "CNY (人民幣)", "KRW (韓元)", "AUD (澳幣)", "CAD (加幣)", "CHF (瑞士法郎)",
        "HKD (港幣)", "SGD (新加坡幣)", "THB (泰銖)", "NZD (紐幣)", "MYR (馬幣)",
        "PHP (菲律賓比索)", "INR (印度盧比)", "IDR (印尼盾)", "VND (越南盾)", "ZAR (南非幣)"
    ]

    @State private var inputAmount = ""
    @State private var exchangeRate = ""
    @State private var fromCurrencyIndex = 0
    @State private var toCurrencyIndex = 1

    var convertedAmount: Double? {
        guard let amount = Double(inputAmount),
              let rate = Double(exchangeRate) else {
            return nil
        }

        // 匯率為：1 fromCurrency = rate toCurrency
        return amount * rate
    }

    var body: some View {
        Form {
            Section(header: Text("輸入金額與匯率")) {
                TextField("輸入金額", text: $inputAmount)
                    .keyboardType(.decimalPad)

                TextField("輸入匯率（1 來源 = ? 目標）", text: $exchangeRate)
                    .keyboardType(.decimalPad)
            }

            Section(header: Text("選擇貨幣")) {
                Picker("從", selection: $fromCurrencyIndex) {
                    ForEach(0..<currencies.count, id: \.self) {
                        Text(currencies[$0])
                    }
                }

                Picker("轉換成", selection: $toCurrencyIndex) {
                    ForEach(0..<currencies.count, id: \.self) {
                        Text(currencies[$0])
                    }
                }
            }

            Section(header: Text("轉換結果")) {
                if let result = convertedAmount {
                    Text("\(result, specifier: "%.4f") \(currencies[toCurrencyIndex])")
                } else {
                    Text("轉換出的金額")
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("匯率轉換器")
    }
}

