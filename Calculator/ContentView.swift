//
//  ContentView.swift
//  Calculator
//
//  Created by 蘇炫瑋 on 2025/4/16.
//

import SwiftUI

struct ContentView: View {

    @State private var path = NavigationPath()
    
    // 用來儲存當前顯示在螢幕上的數字
    @State private var display = "0"
    //用來儲存計算過程
    @State private var calculationProcess = ""
    // 用來儲存計算時的前一個數字以及目前的運算符號
    @State private var previousValue: Double?
    @State private var currentOperator: String?
    // 用來標記是否正在輸入數字
    @State private var isTypingNumber = false

    
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
               //顯示計算過程
                Text(calculationProcess)
                    .font(.system(size: 50))
                    .padding(.trailing, 0.0)
                    .padding(.bottom, 10.0)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: 300, alignment: .trailing)
                // 顯示結果
                Text(display)
                    .font(.system(size: 30))
                    .padding(.trailing, 0.0)
                    .padding(.bottom, 10.0)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: 300, alignment: .trailing)

                // 第一行按鈕，ㄈ (清除)，% 和 ⌫ (刪除)
                HStack {
                    Button("AC") {
                        // 點擊 AC 按鈕時清除所有狀態
                        display = "0"
                        calculationProcess = ""
                        previousValue = nil
                        currentOperator = nil
                        isTypingNumber = false
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 30))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                    Button("%") {
                        handleOperator("%") // 處理除法操作
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                    Button("⌫") {
                        // 刪除最後一位
                        if isTypingNumber && !display.isEmpty {
                            display.removeLast()
                            if display.isEmpty {
                                display = "0"
                                isTypingNumber = false
                            }
                        }
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                    Button("÷") {
                        handleOperator("÷") // 處理除法操作
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                }

                // 下面的數字和運算符按鈕
                HStack {
                    Button("7") {
                        handleDigit("7") // 處理數字 7
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("8") {
                        handleDigit("8") // 處理數字 8
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("9") {
                        handleDigit("9") // 處理數字 9
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("×") {
                        handleOperator("×") // 處理乘法操作
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                }

                // 更多數字和運算符按鈕
                HStack {
                    Button("4") {
                        handleDigit("4") // 處理數字 4
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("5") {
                        handleDigit("5") // 處理數字 5
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("6") {
                        handleDigit("6") // 處理數字 6
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("-") {
                        handleOperator("-") // 處理減法操作
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                }

                // 更多數字和運算符按鈕
                HStack {
                    Button("1") {
                        handleDigit("1") // 處理數字 1
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("2") {
                        handleDigit("2") // 處理數字 2
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("3") {
                        handleDigit("3") // 處理數字 3
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("+") {
                        handleOperator("+") // 處理加法操作
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                }

                // 最後一行按鈕 (0 和 .，以及計算結果)
                HStack {
                    Button("00") {
                        handleDoubleZero() // 處理數字 00
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("0") {
                        handleDigit("0") // 處理數字 0
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button(".") {
                        handleDecimalPoint() // 處理小數點
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("=") {
                        calculateResult() // 計算結果
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.orange)
                    .clipShape(Circle())
                }
            }
            .toolbar {
                // 各種工具列按鈕
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {

                    } label: {
                        Image(systemName: "arrow.up.right.and.arrow.down.left")
                    }
                    .foregroundColor(Color.black)
                    .font(.system(size: 20))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{

                    }label: {
                        VStack{
                            HStack{
                                Text("√")
                                    .font(.system(size: 12))
                                Text("π")
                                    .font(.system(size: 15))
                            }
                            HStack{
                                Text("e")
                                    .font(.system(size: 15))
                                Text("=")
                                    .font(.system(size: 15))
                            }
                        }
                    }
                    .foregroundColor(Color.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        path.append("AddView")
                    } label: {
                        Image(systemName: "square.grid.2x2")
                    }
                    .foregroundColor(Color.black)
                    .font(.system(size: 20))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("︙") {
                        path.append("SetView")
                    }
                    .foregroundColor(Color.black)
                    .font(.system(size: 30))
                }
            }
            .navigationDestination(for: String.self) { destination in
                // 根據不同的目標顯示不同的視圖
                if destination == "AddView" {
                    AddView()
                } else if destination == "SetView" {
                    SetView()
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Color(.systemGray6))
        }
        
    }
    
    // 處理數字輸入
    func handleDigit(_ digit: String) {
        if isTypingNumber {
            calculationProcess += digit
        } else {
            calculationProcess += " " + digit
        }
        isTypingNumber = true
    }

    // 處理小數點輸入
    func handleDecimalPoint() {
        if !display.contains(".") {
            display += "."
            isTypingNumber = true
        }
    }

    // 處理運算符號的輸入
    func handleOperator(_ op: String) {
        if isTypingNumber {
            calculationProcess += " " + op
            isTypingNumber = false
        }

        if let current = Double(calculationProcess.components(separatedBy: " ").dropLast().last ?? "") {
            if let prev = previousValue, let currentOp = currentOperator {
                var result: Double = 0
                switch currentOp {
                case "+": result = prev + current
                case "-": result = prev - current
                case "×": result = prev * current
                case "%": result = prev.truncatingRemainder(dividingBy: current)
                case "÷": result = current != 0 ? prev / current : 0
                default: break
                }
                previousValue = result
            } else {
                previousValue = current
            }
            currentOperator = op
        }
    }


    // 計算結果
    func calculateResult() {
        guard let prev = previousValue, let op = currentOperator else { return }

        let components = calculationProcess.components(separatedBy: " ")
        if let last = components.last, let current = Double(last) {
            var result: Double = 0
            switch op {
            case "+": result = prev + current
            case "-": result = prev - current
            case "×": result = prev * current
            case "%": result = prev.truncatingRemainder(dividingBy: current)
            case "÷": result = current != 0 ? prev / current : 0
            default: break
            }

            calculationProcess += " ="
            display = formatNumber(result)
            previousValue = nil
            currentOperator = nil
            isTypingNumber = false
        }
    }


    // 格式化顯示的數字
    func formatNumber(_ number: Double) -> String {
        // 檢查數字是否超過 Int 的最大值
        if number > Double(Int.max) || number < Double(Int.min) {
            return String(format: "%.8g", number) // 顯示為 Double 格式
        }
        
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(number))" // 如果是整數，轉換為 Int 顯示
        } else {
            return String(format: "%.8g", number) // 顯示精度最多8位，避免太長
        }
    }

    //此為按鈕00，讓數字乘以１００所用
    func handleDoubleZero() {
        // 切割目前的過程為一段段字串（用空格）
        var components = calculationProcess.components(separatedBy: " ")

        // 嘗試抓到最後一個是數字的 component
        if let last = components.last, let number = Double(last) {
            let updated = number * 100
            components.removeLast()
            components.append(formatNumber(updated))
            calculationProcess = components.joined(separator: " ")
        }
    }



    
    
    
    
    
}

#Preview {
    ContentView()
}
