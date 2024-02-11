//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Юрий on 10.02.2024.
//

import SwiftUI


struct ContentView: View {

    let items = ["Rock👊🏻", "Paper🫳🏻", "Scissors✌🏻"]
    
    @State private var computerChoice = ""
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Computer choice \(computerChoice)")
            
            ForEach(0..<items.count, id: \.self) { item in
                Button {
                    buttonTapped(item)
                } label: {
                    Text(items[item])
                        .font(.system(size: 50))
                        .shadow(radius: 10)
                }
            }
            Text("Score \(score)")
                .shadow(radius: 10)
        }
        .padding()
    }
    
    func buttonTapped(_ item: Int) {
        let userChoice = items[item]
        computerChoice = items.randomElement() ?? ""
        
        switch userChoice {
        case "Rock👊🏻":
            if computerChoice == "Scissors✌🏻" {
                score += 1
            } else if computerChoice == "Paper🫳🏻" {
                score -= 1
            }
        case "Paper🫳🏻":
            if computerChoice == "Rock👊🏻" {
                score += 1
            } else if computerChoice == "Scissors✌🏻" {
                score -= 1
            }
        case "Scissors✌🏻":
            if computerChoice == "Paper🫳🏻" {
                score += 1
            } else if computerChoice == "Rock👊🏻" {
                score -= 1
            }
        default:
            print("default case")
        }
    }
}

#Preview {
    ContentView()
}
