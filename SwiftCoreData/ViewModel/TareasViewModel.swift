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
  
   func saveData(context: NSManagedObjectContext){
      let newTarea = Tareas(context: context)
      newTarea.tarea = tarea
      newTarea.id = UUID().uuidString
      
      do {
         try context.save()
         print("DEBUG: se guardo el new tarea")
      } catch let error as NSError {
         print("DEBUG: no guardo el new tarea", error.localizedDescription)
      }
   }
}
