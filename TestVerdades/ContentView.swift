//
//  ContentView.swift
//  TestVerdades
//
//  Created by Raymundo Mondragon Lara on 06/08/24.
//
// On appear para arreglar las preguntas


import SwiftUI

struct ContentView: View {
    // Declaraciones con dos verdades y una mentira
    @State private var statements = [
        "Escriba aquí la primera verdad", // Verdad
        "Escriba aquí la segunda verdad", // Verdad
        "Escriba aquí la mentira" // Mentira
    ]
    
    // Indicador de si las declaraciones son verdades (true) o mentira (false)
    @State private var isTruth = [true, true, false]
    
    // Declaraciones aleatorias combinadas con su indicador de verdad o mentira
    @State private var randomStatements: [(String, Bool)] = []
    
    // Controla si se muestran las respuestas (verdades en verde y mentiras en rojo)
    @State private var showAnswers = false
    
    var body: some View {
        VStack {
            // Contenedor para imagen, título y declaraciones
            VStack(spacing: 20) {
                // Imagen de perfil
                Image("Image") // Reemplaza "profile_placeholder" con el nombre de tu imagen
                    .resizable() // Permite que la imagen se pueda redimensionar
                    .aspectRatio(contentMode: .fill) // Ajusta la imagen para llenar el marco
                    .frame(width: 150, height: 150) // Establece el tamaño de la imagen
                    .clipShape(Circle()) // Da forma circular a la imagen
                    .overlay(Circle().stroke(Color.white, lineWidth: 4)) // Borde blanco alrededor de la imagen
                    .shadow(radius: 10) // Sombra alrededor de la imagen
                    .padding(.top, 20) // Espacio superior para separar de la parte superior de la vista
                
                // Título del juego
                Text("Título")
                    .font(.largeTitle) // Define el tamaño de la fuente
                    .foregroundColor(.primary) // Color del texto adaptable al modo claro/oscuro
                    .padding() // Espacio alrededor del texto
                
                // Declaraciones aleatorias
                ForEach(0..<randomStatements.count, id: \.self) { index in
                    Text(randomStatements[index].0)
                        .font(.title2) // Tamaño de fuente para las declaraciones
                        .padding() // Espacio interno alrededor del texto
                        .background(
                            showAnswers
                                ? (randomStatements[index].1
                                    ? Color.green.opacity(0.2) // Fondo verde para verdades
                                    : Color.red.opacity(0.2)) // Fondo rojo para mentiras
                                : Color.blue.opacity(0.2) // Fondo azul por defecto
                        )
                        .cornerRadius(15) // Bordes redondeados para las tarjetas de texto
                        .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray, lineWidth: 1)) // Borde gris alrededor de cada tarjeta
                        .shadow(color: .gray, radius: 5, x: 2, y: 2) // Sombra alrededor de las tarjetas
                        .padding(.horizontal, 30) // Espacio horizontal alrededor de cada tarjeta
                        .padding(.vertical, 5) // Espacio vertical entre las tarjetas
                        .fixedSize(horizontal: false, vertical: true) // Permite que el texto se expanda verticalmente
                }
                
                Spacer() // Espaciador para empujar el contenido hacia arriba
            }
            .background(Color.white) // Fondo blanco para el contenedor de los elementos
            .cornerRadius(20) // Bordes redondeados para el contenedor
            .padding() // Espacio alrededor del contenedor
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 2) // Borde azul alrededor del contenedor
                    .shadow(color: .gray, radius: 5, x: 2, y: 2) // Sombra gris alrededor del contenedor
            )
            .padding()
            .background(Color(.systemGray6)) // Fondo gris claro detrás del contenedor principal
            .cornerRadius(25) // Bordes redondeados para la capa adicional de fondo
            .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5) // Sombra alrededor del contenedor general
            .padding() // Espacio alrededor del contenedor general
//            .onAppear(perform: shuffleStatements) // Mezcla las declaraciones cuando la vista aparece
            
            // Botones para ordenar de nuevo y mostrar respuestas
            HStack(spacing: 40) {
                // Botón para generar un nuevo orden de declaraciones
                Button(action: shuffleStatements) {
                    Text("Empezar")
                        .font(.headline) // Tamaño de fuente para el botón
                        .padding() // Espacio interno en el botón
                        .frame(width: 150) // Ancho fijo para el botón
                        .background(Color.blue) // Color de fondo del botón
                        .foregroundColor(.white) // Color del texto del botón
                        .cornerRadius(10) // Bordes redondeados para el botón
                        .shadow(color: .blue, radius: 5, x: 2, y: 2) // Sombra azul alrededor del botón
                }
                
                // Botón para mostrar las respuestas
                Button(action: revealAnswers) {
                    Text("Respuestas")
                        .font(.headline) // Tamaño de fuente para el botón
                        .padding() // Espacio interno en el botón
                        .frame(width: 150) // Ancho fijo para el botón
                        .background(Color.green) // Color de fondo del botón
                        .foregroundColor(.white) // Color del texto del botón
                        .cornerRadius(10) // Bordes redondeados para el botón
                        .shadow(color: .green, radius: 5, x: 2, y: 2) // Sombra verde alrededor del botón
                }
            }
            .padding(.bottom, 20) // Espacio inferior para separar de la parte inferior de la vista
        }
    }
    
    // Función para mezclar aleatoriamente las declaraciones
    func shuffleStatements() {
        randomStatements = Array(zip(statements, isTruth)).shuffled()
        showAnswers = false // Oculta las respuestas
    }
    
    // Función para mostrar las respuestas (verdad o mentira)
    func revealAnswers() {
        showAnswers = true // Muestra las respuestas
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
