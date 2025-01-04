//
//  KeyView.swift
//  Caculator
//
//  Created by Kunal 🥀 on 01/01/25.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var changeColor = false
    
    let buttons: [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equals]
    ]
    
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(changeColor ? Color("num").opacity(0.4) : Color.pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut.speed(0.178).repeatForever(), value: changeColor)
                    .onAppear(perform:{
                        self.changeColor.toggle()
                    })
                    .overlay(Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                    )
            }.padding()
            ForEach(buttons, id: \.self){ row in
                GeometryReader { geometry in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { element in
                            Button {
                                self.didTap(button: element)
                            } label: {
                                Text(element.rawValue)
                                    .font(.system(size: 30))
                                    .frame(width: getWidth(geometry: geometry), height: 60)
                                    .background(element.buttonColor)
                                    .foregroundColor(.black)
                                    .cornerRadius(30)
                                    .shadow(color: .purple.opacity(0.8), radius: 30)
                            }
                        }
                    }
                    .frame(width: geometry.size.width)
                    .position(x: geometry.size.width/2, y: geometry.size.height/2)
                }
                .frame(height: 70)
                .padding(.bottom, 4)
            }
        }
    }
    
    func didTap(button: Keys){
        switch button{
            
        case .add, .subtract, .multiply, .divide, .equals:
            if button == .add{
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract{
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply{
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide{
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equals{
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                
                switch self.currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .subtract:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if button != .equals{
                self.value = "0"
            }
            
        case .clear:
            self.value = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    private func getWidth(geometry: GeometryProxy) -> CGFloat {
        
        (geometry.size.width - (5 * 10)) / 4
    }
    private func getHeight(geometry: GeometryProxy) -> CGFloat {
        
        (geometry.size.height - (5 * 10)) / 5
    }
    
}

#Preview {
    KeyView()
}
