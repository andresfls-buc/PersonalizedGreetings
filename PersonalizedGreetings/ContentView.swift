//
//  ContentView.swift
//  PersonalizedGreetings
//
//  Created by Andres Landazabal on 2025/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLanguage = "Español"
    @State private var selectedGender = "Masculino"
    @State private var userName = ""
    
    let languages = ["Español", "Inglés", "Japonés"]
    let genders = ["Masculino", "Femenino"]
    
    var greeting: String {
        guard !userName.trimmingCharacters(in: .whitespaces).isEmpty else {
            return "Por favor, introduce tu nombre"
        }
        let title: String
     

        switch selectedLanguage {
        case "Español":
            title = selectedGender == "Masculino" ? "Señor" : "Señora"
            return "Hola, \(title) \(userName)"
        case "Inglés":
            title = selectedGender == "Masculino" ? "Mister" : "Miss"
            return "Hello, \(title) \(userName)"
        case "Japonés":
            title = selectedGender == "Masculino" ? "様 " : "様 "
            return "こんにちは、\(userName)\(title)"
        default:
            return "Hola"
        }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Escribe tu nombre")
                .font(.headline)
            
            TextField("Nombre", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Selecciona tu idioma")
                .font(.headline)
            
            Picker("Idioma", selection: $selectedLanguage) {
                ForEach(languages, id: \.self) { lang in
                    Text(lang)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("Selecciona tu género")
                .font(.headline)
            
            Picker("Género", selection: $selectedGender) {
                ForEach(genders, id: \.self) { gender in
                    Text(gender)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text(greeting)
                .font(.largeTitle)
                .padding()
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

