//
//  AddMetaView.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import SwiftUI

struct AddMetaView: View {
   
   @Environment(\.managedObjectContext) var context
   @ObservedObject var model = MetasViewModel()
   
    var body: some View {
       VStack{
          TextField("Titulo", text: $model.titulo)
             .textFieldStyle(RoundedBorderTextFieldStyle())
          
          TextField("Descripcion", text: $model.desc)
             .textFieldStyle(RoundedBorderTextFieldStyle())
          
          Button {
             model.saveData(context: context)
          } label: {
             Text("Guardar")
          }
          
          Spacer()

       }
    }
}
