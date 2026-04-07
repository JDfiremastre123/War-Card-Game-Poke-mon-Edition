
import SwiftUI

struct ContentView: View {
    @State var playerCard = "pokemon1"
    @State var CPUCard = "pokemon1"
    
    @State var playerScore = 0
    @State var CPUScore = 0
    
    @State var playerPokemonType = ""
    @State var CPUPokemonType = ""
    
    @State var pokemonTypes = ["bug", "dark", "dragon", "electric", "fairy", "fighting", "fire","flying", "ghost", "grass", "ground", "ice", "normal", "poison", "psychic", "rock", "steel", "water"]
    @State var typeAdvantages: [String: [String]] = [
        "bug": ["psychic", "dark", "grass"],
        "dark": ["psychic", "ghost"],
        "dragon": ["dragon"],
        "electric": ["water", "flying"],
        "fairy": ["dragon", "dark", "fighting"],
        "fighting": ["normal", "dark", "steel", "rock", "ice"],
        "fire": ["grass", "bug", "ice", "steel"],
        "flying": ["bug", "grass", "fighting", "ground"],
        "ghost": ["ghost", "psychic"],
        "grass": ["water", "ground", "rock"],
        "ground": ["electric", "rock", "fire", "poison", "steel"],
        "ice": ["dragon", "grass", "flying", "ground"],
        "normal":[""],
        "poison": ["grass", "fairy"],
        "psychic": ["fighting", "poison"],
        "rock": ["flying", "bug", "ice", "fire"],
        "steel": ["fairy", "rock", "ice", "poison"],
        "water": ["fire", "rock", "ground"]
    ]



    
    var body: some View {
        
        ZStack{
            Image("background-cloth").resizable().ignoresSafeArea()
            VStack {
                Spacer()
                HStack(){
                    Image("Pokemon-Logo").resizable()
                    Image("logo")
                }.padding()
                Spacer()
                HStack{
                    
                    Spacer()
                    VStack{
                        Image(playerCard).resizable()
                        Text(playerPokemonType)
                    }
                
                    Spacer()
                    VStack{
                        Image(CPUCard).resizable()
                        Text(CPUPokemonType)
                    }

                    Spacer()
                    
                }.padding()
                Spacer()
                
                Button{
                    deal()
                }label: {
                    Image("button")
                }
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player").font(.headline).padding()
                        
                        Text(String(playerScore)).font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU").font(.headline).padding()
                        
                        Text(String(CPUScore)).font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
            }
        }
        
        
    }
    func deal(){
        var playerCardValue = Int.random(in: 0...17)
        playerCard = "pokemon" + String(playerCardValue + 1)
        playerPokemonType = pokemonTypes[playerCardValue]
        
        
        
        var CPUCardValue = Int.random(in: 0...17)
        CPUCard = "pokemon" + String(CPUCardValue + 1)
        CPUPokemonType = pokemonTypes[CPUCardValue]


        battle(playerType: playerPokemonType, CPUType: CPUPokemonType)
        
        
    }
    func battle(playerType: String, CPUType: String){
        let playerAdvantages = typeAdvantages[playerType]
        print(playerAdvantages)
        let CPUAdvantages = typeAdvantages[CPUType]
        print(CPUAdvantages)
        if ((playerAdvantages?.contains(CPUType)) == true){
            playerScore += 1
        }
        if((CPUAdvantages?.contains(playerType)) == true){
            CPUScore += 1
        }
        
    }
}

#Preview {
    ContentView()
}
