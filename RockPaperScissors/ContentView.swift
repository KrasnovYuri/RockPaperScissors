//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Юрий on 10.02.2024.
//

import SwiftUI


struct ContentView: View {

    let items = ["Rock👊🏻", "Paper🫳🏻", "Scissors✌🏻"]
    
    @State private var computerChoice = "Scissors✌🏻"
    @State private var score = 0
    @State private var round = 0
    @State private var showingReset = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .green], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Beat the computer!")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 25) {
                    
                    VStack {
                        Text("Computer choice:")
                            .font(.subheadline.weight(.heavy))
                        
                        Text(computerChoice)
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.secondary)
                            .shadow(radius: 10)
                    }
                    
                    
                    
                    ForEach(0..<items.count, id: \.self) { item in
                        Button {
                            buttonTapped(item)
                        } label: {
                            Text(items[item])
                                .foregroundStyle(.indigo)
                                .font(.system(size: 50))
                                .shadow(radius: 10)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                Text("Score \(score)")
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
                Spacer()
            }
            .padding()
            
            .alert("The End", isPresented: $showingReset) {
                Button("Reset", action: resetGame)
            } message: {
                Text("Your score is\n \(score)")
            }
        }
    }
    
    func buttonTapped(_ item: Int) {
        
        round += 1
        
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
        
        if round == 10 {
            showingReset = true
        }
    }
    
    func resetGame() {
        score = 0
        round = 0
    }
}

#Preview {
    ContentView()
}
