//
//  ContentView.swift
//  Calculator
//
//  Created by 蘇炫瑋 on 2025/4/16.
//

import SwiftUI

struct ContentView: View {

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text(" ")
                    .font(.system(size: 50))
                    .padding(.trailing, 0.0)
                    .padding(.bottom, 10.0)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: 300, alignment: .trailing)
                Text(" ")
                    .font(.system(size: 30))
                    .padding(.trailing, 0.0)
                    .padding(.bottom, 10.0)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: 300, alignment: .trailing)
                HStack {
                    Button("AC") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 30))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                    Button("%") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                    Button("⌫") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                    Button("÷") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                }
                HStack {
                    Button("7") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("8") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("9") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("×") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                }
                HStack {
                    Button("4") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("5") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("6") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("-") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                }
                HStack {
                    Button("1") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("2") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("3") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("+") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
                }
                HStack {
                    Button("00") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("0") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button(".") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.white)
                    .clipShape(Circle())
                    Button("=") {

                    }
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .background(.orange)
                    .clipShape(Circle())
                }
            }
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
}

#Preview {
    ContentView()
}
