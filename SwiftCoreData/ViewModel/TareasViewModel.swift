//
//  TareasViewModel.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import Foundation
import CoreData

class TareasViewModel: ObservableObject{
   @Published var tarea: String = ""
  
   func saveData(context: NSManagedObjectContext, meta: Metas){
      let newTarea = Tareas(context: context)
      newTarea.tarea = tarea
      newTarea.id = UUID().uuidString
      // here we stablish the relationship between tareas and metas
      newTarea.idMeta = meta.id
      //here we need to specify the relationahip name that we stablished on coredata
      meta.mutableSetValue(forKey: "relationToTareas").add(newTarea)
      
      do {
         try context.save()
         print("DEBUG: se guardo el new tarea")
      } catch let error as NSError {
         print("DEBUG: no guardo el new tarea", error.localizedDescription)
      }
   }
}
