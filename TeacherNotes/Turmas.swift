import Foundation
import SwiftUI

struct Turma: Identifiable, Codable {
    var id = UUID()
    var nome: String
    var horarioInicio: Date
    var horarioFim: Date
}

class TurmaDataStore: ObservableObject {
    @Published var todasAsTurmas: [Turma] = []
    @Published var diasDeAula: Set<String> = []
    
    func adicionar(nome: String) {
        let nova = Turma(nome: nome, horarioInicio: Date(), horarioFim: Date().addingTimeInterval(3600))
        todasAsTurmas.append(nova)
    }
    
    func remover(at offsets: IndexSet) {
        todasAsTurmas.remove(atOffsets: offsets)
    }
}
