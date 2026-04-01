import SwiftUI

struct DateDisplayView: View {
    let hoje = Date()
    var diaFormatado: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: hoje)
    }
    
    var mesFormatado: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: hoje).uppercased()
    }

    var body: some View {
        VStack(spacing: 0) {
            Text(diaFormatado)
                .font(.system(size: 80, weight: .black))
            
            Text(mesFormatado)
                .font(.system(size: 20, weight: .bold))
                .kerning(2)
        }
    }
}
