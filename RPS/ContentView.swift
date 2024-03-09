//
//  ContentView.swift
//  RPS
//
//  Created by Brage Skrettingland on 09/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State  var cpuScore = 0
    @State var playerScore = 0
    @State var input = 0
    @State var cpu = 0
    @State var showAlert = false
    @State var alert = 0
    @State var winner = ""
    
    func turn(number: Int) {
        cpu = Int.random(in: 1...3)
        
        let result = calculateWinner(cpu: cpu, player: number)
        
        if result == 1 {
            cpuScore += 1
        } else if result == 2 {
            playerScore += 1
        }
        
        if (playerScore == 6) || (cpuScore == 6) {
            showAlert = true
            if playerScore < cpuScore{
                winner = "CPU"
            }
            else{
                winner = "Player"
            }
            alert = 1
        }
     else if result == 0 { // Draw condition
           alert = 2
            showAlert = true
       }
    }

    func resetgame(){
        playerScore = 0
        cpuScore = 0
        cpu = 0
    }
    
    func calculateWinner(cpu:Int,player:Int)-> Int {
        if cpu == player {
            return 0 //tie
        } else if (cpu == 1 && player == 3) ||
                  (cpu == 2 && player == 1) ||
                  (cpu == 3 && player == 2) {
            return 1 //cpu win
        } else {
            return 2 //player win
        }
    }

    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Rock ✊🏽, Paper ✋🏽 , Scissors ✌🏽")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding()
                    .shadow(radius: 10)
                    
                   
                Spacer()
                
                HStack{
                    Image(String(cpu))
                        .padding(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                   
                }
                Spacer()
                
                HStack {
                    Button(action: {
                        input = 1
                        turn(number:input)
                    }) {
                        Image("1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    Button(action: {
                        input = 2
                        turn(number:input)
                    }) {
                        Image("2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    Button(action: {
                        input = 3
                        turn(number:input)
                    }) {
                        Image("3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                }
                
                .padding()
              Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .fontDesign(.rounded)
                            .foregroundColor(Color.black)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Text(String(cpuScore))
                            .padding(.bottom,100)
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                   
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .fontDesign(.rounded)
                            .foregroundColor(Color.black)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                        Text(String(playerScore))
                            .padding(.bottom,100)
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                    }
                    Spacer()
                   
            }
            Spacer()
                Button(action: {
                    resetgame()
                }) {
                    Spacer()
                    Image("restart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding()
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                if alert == 1 {
                    return Alert(
                        title: Text("The winner is: " + winner + "🚀🚀"),
                        dismissButton: .default(Text("New game")) {
                            resetgame()
                        }
                    )
                } else  {
                    return Alert(
                        title: Text("Draw"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

