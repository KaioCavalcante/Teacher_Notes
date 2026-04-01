import SwiftUI

struct Home: View {
    @ObservedObject var store: TurmaDataStore
    var body: some View {
        ZStack {
            
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                
                HStack {
                    Text("Agenda")
                        .font(.system(size: 34, weight: .black))
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "message.fill")
                            .foregroundColor(.blue)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.top, 30)
                
                Spacer()
                
                
                VStack(spacing: 20) {
                    
                    
                    VStack(spacing: 0) {
                        Text("21")
                            .font(.system(size: 80, weight: .black))
                        
                        Text("MARÇO")
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                    Text("SÁBADO")
                        .font(.system(size: 12, weight: .semibold))
                        .opacity(0.8)
                    
                    
                    HStack {
                        Text("9º ANO A")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 12, weight: .bold))
                    .padding(.horizontal, 15)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
                }
                .foregroundColor(.white)
                .frame(width: 250, height: 320)
                .background(Color.blue)
                .cornerRadius(40)
                .shadow(radius: 10)
                
                Spacer()
                
                
                HStack {
                    Text("MINHAS TURMAS")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("EDITAR")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.blue)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(store: TurmaDataStore())
    }
}
