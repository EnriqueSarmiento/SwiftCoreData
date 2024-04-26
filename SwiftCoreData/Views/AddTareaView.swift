//
//  AddTareaView.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import SwiftUI

struct AddTareaView: View {
   
   @Environment(\.managedObjectContext) var context
   @ObservedObject var model = TareasViewModel()
   var meta : Metas
   
    var body: some View {
       VStack{
          TextField("Tarea", text: $model.tarea)
             .textFieldStyle(RoundedBorderTextFieldStyle())
          
          Button {
             model.saveData(context: context, meta: meta)
          } label: {
             Text("Guardar tarea")
          }
          
          Spacer()

       }
    }
}
