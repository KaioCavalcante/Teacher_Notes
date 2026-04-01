import SwiftUI

struct TelaConfigIniciais: View {
    @StateObject var viewModel = TurmaViewModel()
    let opcoes = ["Segunda-Feira","Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado", "Domingo"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("F2F2F7").ignoresSafeArea()
                VStack {
                    Text("Quais dias da semana você dá aula?")
                        .font(.title).bold().multilineTextAlignment(.center).padding()
                    
                    Divider()
                    
                    ScrollView {
                        ForEach(opcoes, id: \.self) { opcao in
                            Button(action: { viewModel.alternarSelecao(dia: opcao) }) {
                                HStack {
                                    Image(systemName: viewModel.diasDeAula.contains(opcao) ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(viewModel.diasDeAula.contains(opcao) ? .blue : .gray)
                                    Text(opcao).foregroundColor(.primary)
                                    Spacer()
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(viewModel.diasDeAula.contains(opcao) ? Color.blue : Color.clear, lineWidth: 2))
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationBarItems(trailing: botaoProximo)
        }
    }
    
    private var botaoProximo: some View {
        Group {
            if !viewModel.diasDeAula.isEmpty {
                NavigationLink(destination: TelaAddTurma(viewModel: viewModel)) {
                    Text("Próximo").bold()
                }
            } else {
                Text("Próximo").bold().foregroundColor(.gray)
            }
        }
    }
}
