//
//  ContentView.swift
//  Temp
//
//  Created by Filatov Yurii on 11.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var inTemp = ""
    @State private var caindOfTemp = 0
    @State private var totalTemp = 0.0
    
    let tipeOfTemp = ["°F","°K" ]
    var totalTempOut: Double {
        let tipSelection = tipeOfTemp[caindOfTemp]
        let inTemperature = Double(inTemp) ?? 0
        var neadTemp :Double {
            if tipSelection == "°F"{
                return (inTemperature * 9 / 5) + 32.0
            }else{
                return inTemperature + 273.15
            }
        }
        return neadTemp
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Temp in °C ", text: $inTemp, onCommit: {
                        ForEach(-20..<30){
                            Text("\($0) degrees of Celsia")
                        }
                    })
                }
                
                Section(header: Text("Convert to: ")){
                    Picker("Type", selection: $caindOfTemp){
                        ForEach(0..<tipeOfTemp.count){
                            Text("\(self.tipeOfTemp[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("Total degrees \(totalTempOut,  specifier: "%.2f")")
                }
            }
            
            
            
            .navigationTitle("Temp Converter")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
