//
//  MetasViewModel.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import Foundation
import CoreData

class MetasViewModel: ObservableObject {
   @Published var titulo: String = ""
   @Published var desc: String = ""
   
   func saveData(context: NSManagedObjectContext){
      let newMeta = Metas(context: context)
      newMeta.titulo = titulo
      newMeta.desc = desc
      newMeta.id = UUID().uuidString
      
      do {
         try context.save()
         print("DEBUG: se guardo el new meta")
      } catch let error as NSError {
         print("DEBUG: no guardo el new meta", error.localizedDescription)
      }
   }
}
