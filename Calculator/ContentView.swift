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
    //紀錄是否按下等於
    @State private var didPressEqual = false


    
    
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
                            //這樣的寫法可讓整個圓形才會成為觸控區域
                            Button(action: {
                                handleFunction("fact")
                            }) {
                                Text("!")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .contentShape(Circle()) //點擊區是圓形
                            }
                            .padding(.horizontal, 4)
                            .buttonStyle(PlainButtonStyle()) // 手機上去除黑框

                            // log 按鈕
                            Button(action: {
                                handleFunction("log")
                            }) {
                                Text("log")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .contentShape(Circle()) // 讓整個圓形皆可點擊
                            }
                            .padding(.horizontal, 4)
                            .buttonStyle(PlainButtonStyle())

                            // π 按鈕
                            Button(action: {
                                handleDigit("π")
                            }) {
                                Text("π")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .contentShape(Circle()) // 讓整個圓形皆可點擊
                            }
                            .padding(.horizontal, 4)
                            .buttonStyle(PlainButtonStyle())

                            // √ 按鈕
                            Button(action: {
                                handleFunction("sqrt")
                            }) {
                                Text("√")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .contentShape(Circle()) // 讓整個圓形皆可點擊
                            }
                            .padding(.horizontal, 4)
                            .buttonStyle(PlainButtonStyle())

                            
                        }
                        HStack {
                            // sin 按鈕
                            Button(action: {
                                handleFunction("sin")
                            }) {
                                Text("sin")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .contentShape(Circle())
                            }
                            .padding(.horizontal, 4)
                            .buttonStyle(PlainButtonStyle())

                            // cos 按鈕
                            Button(action: {
                                handleFunction("cos")
                            }) {
                                Text("cos")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .contentShape(Circle())
                            }
                            .padding(.horizontal, 4)
                            .buttonStyle(PlainButtonStyle())

                            // tan 按鈕
                            Button(action: {
                                handleFunction("tan")
                            }) {
                                Text("tan")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .contentShape(Circle())
                            }
                            .padding(.horizontal, 4)
                            .buttonStyle(PlainButtonStyle())

                            // cot 按鈕
                            Button(action: {
                                handleFunction("cot")
                            }) {
                                Text("cot")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .contentShape(Circle())
                            }
                            .padding(.horizontal, 4)
                            .buttonStyle(PlainButtonStyle())

                            
                        }
                    }
                   
                }
                
                //********************上面為進階運算排版*************************
                //********************下面為正常運算排版*************************
                // 第一行按鈕
                Spacer()
                HStack {
                    // AC 按鈕
                    Button(action: {
                        display = "0"
                        calculationProcess = ""
                        previousValue = nil
                        currentOperator = nil
                        isTypingNumber = false
                    }) {
                        Text("AC")
                            .font(.system(size: 30))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // % 按鈕
                    Button(action: {
                        handleOperator("%")
                    }) {
                        Text("%")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // ⌫ 按鈕
                    Button(action: {
                        if isTypingNumber && !calculationProcess.isEmpty {
                            calculationProcess.removeLast()
                            if calculationProcess.isEmpty {
                                calculationProcess = "0"
                                isTypingNumber = false
                            }
                        }
                    }) {
                        Text("⌫")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // ÷ 按鈕
                    Button(action: {
                        handleOperator("÷")
                    }) {
                        Text("÷")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }

                // 下面的數字和運算符按鈕
                HStack {
                    // 數字 7
                    Button(action: {
                        handleDigit("7")
                    }) {
                        Text("7")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // 數字 8
                    Button(action: {
                        handleDigit("8")
                    }) {
                        Text("8")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // 數字 9
                    Button(action: {
                        handleDigit("9")
                    }) {
                        Text("9")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // 乘號 ×
                    Button(action: {
                        handleOperator("×")
                    }) {
                        Text("×")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                }

                // 數字和運算符按鈕
                HStack {
                    // 數字 4
                    Button(action: {
                        handleDigit("4")
                    }) {
                        Text("4")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // 數字 5
                    Button(action: {
                        handleDigit("5")
                    }) {
                        Text("5")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // 數字 6
                    Button(action: {
                        handleDigit("6")
                    }) {
                        Text("6")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    // 減號 -
                    Button(action: {
                        handleOperator("-")
                    }) {
                        Text("-")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                }

                // 數字和運算符按鈕
                HStack {
                    Button(action: {
                        handleDigit("1")
                    }) {
                        Text("1")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    Button(action: {
                        handleDigit("2")
                    }) {
                        Text("2")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    Button(action: {
                        handleDigit("3")
                    }) {
                        Text("3")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    Button(action: {
                        handleOperator("+")
                    }) {
                        Text("+")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                }

                // 最後一行按鈕 (0 和 .，以及計算結果)
                HStack {
                    Button(action: {
                        handleDoubleZero()
                    }) {
                        Text("00")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    Button(action: {
                        handleDigit("0")
                    }) {
                        Text("0")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    Button(action: {
                        handleDecimalPoint()
                    }) {
                        Text(".")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())

                    Button(action: {
                        calculateResult()
                    }) {
                        Text("=")
                            .font(.system(size: 40))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(Color.orange)
                            .clipShape(Circle())
                            .contentShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
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
        // 如果剛剛按下等號，就重設
        if didPressEqual {
            calculationProcess = ""
            display = ""
            previousValue = nil
            currentOperator = nil
            isTypingNumber = false
            didPressEqual = false // ⭐️ 清除狀態
        }
        if digit == "π" {
            // 如果前面是數字，插入乘號
            if let lastChar = calculationProcess.last, lastChar.isNumber {
                calculationProcess += " × π"
            }
        } else {
            //正常運算
            if isTypingNumber {
                calculationProcess += digit
            } else {
                calculationProcess += " " + digit
            }
            isTypingNumber = true
        }
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
        //避免使用者連續按下兩次等於，若按下兩次等於直接讓運算歸零，進行新的運算
        if didPressEqual == true{
            calculationProcess = ""
            display = "0"
            previousValue = nil
            currentOperator = nil
            isTypingNumber = false
            didPressEqual = false // ⭐️ 清除狀態
        }else{
            let expression = calculationProcess.trimmingCharacters(in: .whitespaces)

            if let result = ExpressionParser.evaluate(expression: expression) {
                display = formatNumber(result)
                calculationProcess += " ="
                previousValue = nil
                currentOperator = nil
                isTypingNumber = false
                didPressEqual = true // 記錄按下等於
            } else {
                display = "錯誤"
            }
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
        // 先處理乘法，例如 "2π"
        var modifiedExpression = expression
        
        // 使用正則表達式找出數字後直接接 π 的狀況，插入乘號 *
        let patterns = [
            #"(?<=\d)π"#,    // 數字後面接 π
        ]
        //送到 ExpressionParser.evaluate 後：expression = "2 × π"
        //先替換 π 為 3.1415926
        //變成 2 × 3.1415926
        for pattern in patterns {
            modifiedExpression = modifiedExpression.replacingOccurrences(of: pattern, with: "*π", options: .regularExpression)
        }
        
        // 將 π 替換成 Double.pi 字串
        modifiedExpression = modifiedExpression.replacingOccurrences(of: "π", with: String(Double.pi))
        
        // 拆成 tokens
        var tokens = modifiedExpression.components(separatedBy: " ")
        
        // 之後照原本邏輯計算乘除與加減
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
                        return nil
                    }
                } else {
                    return nil
                }
            } else {
                index += 1
            }
        }

        // 加減法處理
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
