//
//  SettingView.swift
//  oekaki
//
//  Created by 金城秀作 on 2021/02/20.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var colorSel:Int // 色
    @Binding var lineWidth:Int // 線幅
    @Binding var colors:[Color] // 設定可能な色
    
    var body: some View {
        VStack{
            // 色選択
            Picker(selection: $colorSel, label: Text("色").frame(width: 40)) {
                ForEach(0..<colors.count){value in
                    if value == self.colors.count - 1 {
                        // 消しゴム用
                        Image(systemName: "square")
                    } else {
                        Image(systemName: "paintbrush.fill")
                            .foregroundColor(self.colors[value])
                    }
                }
            }
            
            // 線幅選択
            Picker(selection: $lineWidth, label: Text("線幅").frame(width: 40)) {
                ForEach(1..<11){ value in
                    Text(String(value))
                }
            }
            .frame(width: 30)
            
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("閉じる")
            }
        }.padding()
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(colorSel: .constant(0), lineWidth: .constant(3), colors: .constant([.black, .red, .blue, .green, .white]))
    }
}
