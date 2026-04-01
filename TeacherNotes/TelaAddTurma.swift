import SwiftUI

struct TelaAddTurma: View {
    
    @ObservedObject var store: TurmaDataStore
    @State private var mostrarModal = false
    @State private var nomeNovaTurma = ""
    @State private var dataInicio = Date()
    @State private var dataFim = Date()
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground).ignoresSafeArea()
            
            VStack {
                Text("Suas turmas")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                Divider()
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(store.todasAsTurmas) { turma in
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text(turma.nome)
                                        .font(.headline)
                                    Spacer()
                                    Button(action: { removerTurma(turma) }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.blue)
                                            .font(.title3)
                                    }
                                }
                                HStack {
                                    Image(systemName: "clock")
                                    Text("\(turma.horarioInicio, formatter: timeFormatter) - \(turma.horarioFim, formatter: timeFormatter)")
                                }
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.05), radius: 5)
                        }
                        
                       
                        Button(action: {
                            mostrarModal = true
                        }) {
                            HStack {
                                Image(systemName: "plus.circle")
                                Text("Adicionar nova turma")
                                    .bold()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: [5]))
                            )
                        }
                    }
                    .padding()
                    .navigationBarTitle(Text(""), displayMode: NavigationBarItem.TitleDisplayMode.inline)
                    .navigationBarItems(trailing:
                                            NavigationLink(destination: Home(store:store)){
                        Text("Próximo")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)}
                                        
                    )
                }
            }
        }
        
        .sheet(isPresented: $mostrarModal) {
            NavigationView {
                
                Form {
                    Section(header: Text("Informações da Turma")) {
                        TextField("Nome da Turma (ex: A211)", text: $nomeNovaTurma)
                    }.font(.title)
                    
                    Section(header: Text("Horários")) {
                        DatePicker("Início", selection: $dataInicio, displayedComponents: .hourAndMinute)
                        DatePicker("Término", selection: $dataFim, displayedComponents: .hourAndMinute)
                    }.font(.title)
                }
                .navigationBarTitle("Nova Turma", displayMode: .inline)
                .navigationBarItems(
                    leading: Button("Cancelar") { mostrarModal = false },
                    trailing: Button("Salvar") {
                        salvarNovaTurma()
                    }.disabled(nomeNovaTurma.isEmpty)
                )
            }
        }
    }
    
    
    func salvarNovaTurma() {
        let nova = Turma(nome: nomeNovaTurma, horarioInicio: dataInicio, horarioFim: dataFim)
        withAnimation {
            store.todasAsTurmas.append(nova)
        }
        nomeNovaTurma = ""
        mostrarModal = false
    }
    
    func removerTurma(_ turma: Turma) {
        if let index = store.todasAsTurmas.firstIndex(where: { $0.id == turma.id }) {
            withAnimation {
                store.todasAsTurmas.remove(at: index)
            }
        }
    }
}

struct TelaAddTurma_Previews: PreviewProvider {
    static var previews: some View {
        TelaAddTurma(store: TurmaDataStore())
    }
}

