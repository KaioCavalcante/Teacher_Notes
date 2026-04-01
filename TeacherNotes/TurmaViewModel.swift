import SwiftUI

class TurmaViewModel: ObservableObject {
    @Published var todasAsTurmas: [Turma] = []
    @Published var diasDeAula: Set<String> = []
    
    func alternarSelecao(dia: String) {
        if diasDeAula.contains(dia) {
            diasDeAula.remove(dia)
        } else {
            diasDeAula.insert(dia)
        }
    }

    func salvarNovaTurma(nome: String, inicio: Date, fim: Date) {
        let nova = Turma(nome: nome, horarioInicio: inicio, horarioFim: fim)
        withAnimation {
            todasAsTurmas.append(nova)
        }
    }
    
    func removerTurma(_ turma: Turma) {
        if let index = todasAsTurmas.firstIndex(where: { $0.id == turma.id }) {
            withAnimation {
                todasAsTurmas.remove(at: index)
            }
        }
    }
}
