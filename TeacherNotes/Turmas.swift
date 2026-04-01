import Foundation
import SwiftUI

struct Turma: Identifiable, Codable {
    var id = UUID()
    var nome: String
    var horarioInicio: Date
    var horarioFim: Date
}

