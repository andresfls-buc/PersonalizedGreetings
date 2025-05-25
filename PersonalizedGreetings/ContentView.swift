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
            return "Por favor, ingresa tu nombre."
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
            title = "様 "
            return "こんにちは、\(userName)\(title)"
        default:
            return "Hola"
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Escribe tu nombre")
                .font(.headline)

            TextField("Tu nombre aquí", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Selecciona tu idioma")
                .font(.headline)
            
            HStack {
                ForEach(languages, id: \.self) { lang in
                    Button(action: {
                        selectedLanguage = lang
                    }) {
                        Text(lang)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(selectedLanguage == lang ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedLanguage == lang ? .white : .primary)
                            .cornerRadius(10)
                    }
                }
            }

            Text("Selecciona tu género")
                .font(.headline)
            
            HStack {
                ForEach(genders, id: \.self) { gender in
                    Button(action: {
                        selectedGender = gender
                    }) {
                        Text(gender)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(selectedGender == gender ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedGender == gender ? .white : .primary)
                            .cornerRadius(10)
                    }
                }
            }
            
            Text(greeting)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
