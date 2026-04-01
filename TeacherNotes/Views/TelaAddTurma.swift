import SwiftUI

struct TelaAddTurma: View {
    @ObservedObject var viewModel: TurmaViewModel
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
                Text("Suas turmas").font(.title).bold().padding(.top)
                Divider()
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.todasAsTurmas) { turma in
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text(turma.nome).font(.headline)
                                    Spacer()
                                    Button(action: { viewModel.removerTurma(turma) }) {
                                        Image(systemName: "xmark.circle.fill").foregroundColor(.blue).font(.title3)
                                    }
                                }
                                HStack {
                                    Image(systemName: "clock")
                                    Text("\(turma.horarioInicio, formatter: timeFormatter) - \(turma.horarioFim, formatter: timeFormatter)")
                                }.font(.subheadline).foregroundColor(.gray)
                            }
                            .padding().background(Color.white).cornerRadius(10).shadow(color: Color.black.opacity(0.05), radius: 5)
                        }
                    
                        Button(action: { mostrarModal = true }) {
                            HStack {
                                Image(systemName: "plus.circle")
                                Text("Adicionar nova turma").bold()
                            }
                            .padding().frame(maxWidth: .infinity).foregroundColor(.blue)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: [5])))
                        }
                    }.padding()
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: Home(viewModel: viewModel)) {
                Text("Próximo").fontWeight(.bold)
            })
        }
        .sheet(isPresented: $mostrarModal) {
            modalDeCadastro
        }
    }
    
    var modalDeCadastro: some View {
        NavigationView {
            Form {
                Section(header: Text("Informações da Turma")) {
                    TextField("Nome da Turma (ex: A211)", text: $nomeNovaTurma)
                }
                Section(header: Text("Horários")) {
                    DatePicker("Início", selection: $dataInicio, displayedComponents: .hourAndMinute)
                    DatePicker("Término", selection: $dataFim, displayedComponents: .hourAndMinute)
                }
            }
            .navigationBarTitle("Nova Turma", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancelar") { mostrarModal = false },
                trailing: Button("Salvar") {
                    viewModel.salvarNovaTurma(nome: nomeNovaTurma, inicio: dataInicio, fim: dataFim)
                    nomeNovaTurma = ""
                    mostrarModal = false
                }.disabled(nomeNovaTurma.isEmpty)
            )
        }
    }
}
