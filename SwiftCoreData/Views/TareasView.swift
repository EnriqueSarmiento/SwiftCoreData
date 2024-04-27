//
//  TareasView.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import SwiftUI
import CoreData

struct TareasView: View {
   
   var meta: Metas
   
   @Environment(\.managedObjectContext) var context
   
   //here we create a fetch request to coredate to retorn our tareas data but we need to pass the id of each meta, so a simple fetchRequest will not be helpfull like in metas. We need to create a constructer.
   //@FetchRequest(entity: Tareas.entity(), sortDescriptors: []) var tareas: FetchedResults<Tareas>
   var tareas : FetchRequest<Tareas>
   
   init(meta: Metas) {
      self.meta = meta
      self.tareas = FetchRequest<Tareas>(entity: Tareas.entity(), sortDescriptors: [], predicate: NSPredicate(format: "idMeta == %@", meta.id!))
   }
   
   var body: some View {
      VStack{
         List{
            ForEach(tareas.wrappedValue){ tarea in
               NavigationLink(destination: FotoView(tarea: tarea)) {
                  VStack(alignment: .leading) {
                     Text(tarea.tarea ?? "")
                        .font(.title)
                  }
               }
               
            }
         }
         NavigationLink(destination: AddTareaView(meta: meta)) {
            Image(systemName: "note")
         }
      }.navigationTitle("Tareas para \(meta.titulo ?? "")")
   }
   
}
