//
//  Buttom.swift
//  ToDoList
//
//  Created by Brayan burgos on 6/10/23.
//

import SwiftUI

struct TLButton: View {
    let tittle: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            // Attemp Login Action
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(tittle)
                    .foregroundColor(Color.white)
                    .bold()
            }
            .padding()
            
        }
    }
}


