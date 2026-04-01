//
//  TelaConfigIniciais.swift
//  TeacherNotes
//
//  Created by Academy on 25/03/26.
//

import SwiftUI

struct TelaConfigIniciais: View {
    @StateObject var store = TurmaDataStore()
    let opcoes = ["Segunda-Feira","Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado", "Domingo" ]
    let colunas = [GridItem(.adaptive(minimum: 100))]
    var body: some View{
        NavigationView{
            
            ZStack{
                Color("F2F2F7").ignoresSafeArea()
                VStack{
                    Text("Quais dias da semana você dá aula?")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Divider()
                    ScrollView{
                        
                        ForEach(opcoes, id: \.self){ opcao in Button(action: {
                            alternarSelecao(item: opcao)
                            
                        }){
                            HStack(spacing: 15){
                                Image(systemName: store.diasDeAula.contains(opcao) ? "checkmark.circle.fill" : "circle")
                                    .font(.title2)
                                    .foregroundColor(store.diasDeAula.contains(opcao) ? .blue : .gray)
                                
                                Text(opcao)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .padding()
                            
                            .foregroundColor(store.diasDeAula.contains(opcao) ? Color.red: Color.black)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(store.diasDeAula.contains(opcao) ? Color.blue : Color.clear, lineWidth: 2)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                        }
                        
                    }
                    .navigationBarTitle(Text(""), displayMode: NavigationBarItem.TitleDisplayMode.inline)
                    .navigationBarItems(trailing:
                        Group {
                        if !store.diasDeAula.isEmpty {
                            NavigationLink(destination: TelaAddTurma(store:store)) {
                                Text("Próximo")
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                            }
                        } else {
                            Text("Próximo")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)                        }
                    }
                    )
                    
                }
            }
        }
    }
    func alternarSelecao(item: String){
        if store.diasDeAula.contains(item){
            store.diasDeAula.remove(item)
        }
        else{
            store.diasDeAula.insert(item)
        }
        
    }
}




struct TelaConfigIniciais_Previews: PreviewProvider {
    static var previews: some View {
        TelaConfigIniciais()
    }
}
