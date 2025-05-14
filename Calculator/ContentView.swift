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
    // 用來儲存計算過程
    @State private var calculationProcess = ""
    // 用來儲存計算時的前一個數字以及目前的運算符號
    @State private var previousValue: Double?
    @State private var currentOperator: String?
    // 用來標記是否正在輸入數字
    @State private var isTypingNumber = false
    // 右上角按鈕第一個按下出現更多運算使用
    @State private var showAdvancedOperators = false

    
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
         
               //顯示計算過程
                Text(calculationProcess)
                    .font(.system(size: 35))
                    .padding(.trailing, 0.0)
                    .padding(.bottom, 10.0)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 30)
                    .padding(.top, 50)
                
                // 顯示結果
                Text(display)
                    .font(.system(size: 25))
                    .padding(.trailing, 0.0)
                    .padding(.bottom, 10.0)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 30)

                           
                
                //判斷是否按下進階其他功能鍵
                if showAdvancedOperators {
                    VStack {
                        Spacer()
                        
                        HStack {
                            Button("!") {
                                handleFunction("fact")
                            }
                            .frame(width: 50, height: 50)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.horizontal, 4)
                            
                            Button("log") {
                                handleFunction("log")
                            }
                            .frame(width: 50, height: 50)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.horizontal, 4)
                            
                            Button("π") {
                                handleDigit(String(Double.pi))
                            }
                            .frame(width: 50, height: 50)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.horizontal, 4)
                            
                            Button("√") {
                                handleFunction("sqrt")
                            }
                            .frame(width: 50, height: 50)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.horizontal, 4)
                          
                        }
                        HStack {
                            Button("sin") {
                                handleFunction("sin")
                            }
                            .frame(width: 50, height: 50)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.horizontal, 4)
                            
                            Button("cos") {
                                handleFunction("cos")
                            }
                            .frame(width: 50, height: 50)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.horizontal, 4)
                            
                            Button("tan") {
                                handleFunction("tan")
                            }
                            .frame(width: 50, height: 50)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.horizontal, 4)
                            
                            Button("cot") {
                                handleFunction("cot")
                            }
                            .frame(width: 50, height: 50)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.horizontal, 4)
                            
                        }
                    }
                   
                }
                
                //********************上面為進階運算排版*************************
                //********************下面為正常運算排版*************************
                // 第一行按鈕
                Spacer()
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
                        handleOperator("%") // 處理求於數
                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                    Button("⌫") {
                        // 刪除最後一位
                        if isTypingNumber && !calculationProcess.isEmpty {
                            calculationProcess.removeLast()
                            if calculationProcess.isEmpty {
                                calculationProcess = "0"
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

                // 數字和運算符按鈕
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

                // 數字和運算符按鈕
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
            
            // 各種工具列按鈕
            .toolbar {
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
                        showAdvancedOperators.toggle()
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
            if isTypingNumber {
                calculationProcess += ".";
            } else {
                //尚未開始輸入數字但按下小數點
                display = "0."
                calculationProcess += "0."
                isTypingNumber = true
            }
        }
    }


    // 處理運算符號的輸入
    func handleOperator(_ op: String) {
        if isTypingNumber {
            calculationProcess += " " + op
            isTypingNumber = false
        }
    }
    //內建並沒有cot
    func cot(_ x: Double) -> Double {
        return 1 / tan(x)
    }
    
    //更多功能鍵使用
    func handleFunction(_ function: String) {
        // 取最後輸入的數字進行處理
        var components = calculationProcess.components(separatedBy: " ")
        
        if let last = components.last, let number = Double(last) {
            if number.isNaN || number.isInfinite {
                display = "⚠️ 無效數值"
                return
            }

            var result: Double?
            
            switch function {
            case "sin": result = sin(number)
            case "cos": result = cos(number)
            case "tan": result = tan(number)
            case "cot":result = cot(number)
            case "log": result = log10(number)
            case "sqrt": result = sqrt(number)
            case "fact":
                if number < 0 || floor(number) != number {
                    display = "⚠️ 階層僅支援非負整數"
                    return
                }
                
                // 使用 Double 來計算大型階層，注意超大值會失真
                let factorial = (1...Int(number)).reduce(1.0) { $0 * Double($1) }
                result = factorial


            default: break
            }

            if let r = result {
                components.removeLast()
                components.append(formatNumber(r))
                calculationProcess = components.joined(separator: " ")
                display = formatNumber(r)
            } else {
                display = "錯誤"
            }
        }
    }



    // 計算結果，先乘除後加減
    func calculateResult() {
        let expression = calculationProcess.trimmingCharacters(in: .whitespaces)

        if let result = ExpressionParser.evaluate(expression: expression) {
            display = formatNumber(result)
            calculationProcess += " ="
            previousValue = nil
            currentOperator = nil
            isTypingNumber = false
        } else {
            display = "錯誤"
        }
    }


    func formatNumber(_ number: Double) -> String {
        // 若數字非常大，使用科學記號表示（例如 > 1e10）
        if abs(number) >= 1e10 || abs(number) <= 1e-6 {
            return String(format: "%.8e", number)
        }

        // 檢查是否為整數
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(number))
        } else {
            // 最多 8 位有效數字，去掉多餘的 0
            return String(format: "%g", number)
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



// 解析字串運算式 先乘除與取餘，再加減
class ExpressionParser {
    static func evaluate(expression: String) -> Double? {
        var tokens = expression.components(separatedBy: " ")

        // 處理乘除與取餘
        var index = 0
        while index < tokens.count {
            if tokens[index] == "×" || tokens[index] == "÷" || tokens[index] == "%" {
                if let left = Double(tokens[index - 1]),
                   let right = Double(tokens[index + 1]) {

                    var result: Double?

                    switch tokens[index] {
                    case "×":
                        result = left * right
                    case "÷":
                        result = right != 0 ? left / right : nil
                    case "%":
                        result = right != 0 ? Double(Int(left) % Int(right)) : nil
                    default:
                        break
                    }

                    if let result = result {
                        tokens.replaceSubrange(index - 1...index + 1, with: [String(result)])
                        index = max(index - 1, 0)
                    } else {
                        return nil // 除以 0 或其他錯誤
                    }

                } else {
                    return nil
                }
            } else {
                index += 1
            }
        }

        // 處理加減
        index = 0
        while index < tokens.count {
            if tokens[index] == "+" || tokens[index] == "-" {
                if let left = Double(tokens[index - 1]),
                   let right = Double(tokens[index + 1]) {
                    let result = tokens[index] == "+" ? left + right : left - right
                    tokens.replaceSubrange(index - 1...index + 1, with: [String(result)])
                    index = max(index - 1, 0)
                } else {
                    return nil
                }
            } else {
                index += 1
            }
        }

        return Double(tokens.first ?? "")
    }
}





#Preview {
    ContentView()
}
