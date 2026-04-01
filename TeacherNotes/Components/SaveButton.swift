//
//  SaveButton.swift
//  TeacherNotes
//
//  Created by Academy on 30/03/26.
//

import SwiftUI

struct SaveButton: View {
    var body: some View {
        Button(action: {
            
        }){
            Text("Salvar")
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(.blue)
        }
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton()
    }
}
