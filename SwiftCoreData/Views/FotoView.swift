//
//  FotoView.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import SwiftUI
import CoreData

struct FotoView: View {
   
   
   
   @Environment(\.managedObjectContext) var context
   var tarea: Tareas
   var fotos : FetchRequest<Fotos>
   
   init(tarea: Tareas) {
      self.tarea = tarea
      self.fotos = FetchRequest<Fotos>(entity: Fotos.entity(), sortDescriptors: [], predicate: NSPredicate(format: "idTarea == %@", tarea.id!))
   }
   
   @State private var imageData : Data = .init(capacity: 0)
   @State private var mostrarMenu = false
   @State private var imagePicker = false
   @State private var source : UIImagePickerController.SourceType = .camera
   
   
   func save(image: Data, context: NSManagedObjectContext){
      let newFoto = Fotos(context: context)
      newFoto.foto = image
      //here we stablish the relationship
      newFoto.idTarea = tarea.id
      tarea.mutableSetValue(forKey: "relationToFotos").add(newFoto)
   
      
      do {
         try context.save()
         print("DEBUG: guardo la foto")
      } catch let error as NSError {
         print("DEBUG: hubo un error guardando la foto", error.localizedDescription)
      }
   }
   
   var body: some View {
      NavigationView {
         VStack{
            NavigationLink(destination: ImagePicker(show: self.$imagePicker, image: self.$imageData, source: self.source), isActive: self.$imagePicker) {
               Text("")
            }.navigationBarTitle("")
               .navigationBarHidden(true)
            Text("Grid")
            HStack(alignment: .center, spacing: 60){
               Button(action:{
                  self.mostrarMenu.toggle()
               }){
                  Image(systemName: "camera")
               }.actionSheet(isPresented: self.$mostrarMenu) {
                  ActionSheet(title: Text("Menu"), message: Text("Selecciona una opción"), buttons: [
                     .default(Text("Camara"), action: {
                        self.source = .camera
                        self.imagePicker.toggle()
                     }),
                     .default(Text("Libreria"), action: {
                        self.source = .photoLibrary
                        self.imagePicker.toggle()
                     }),
                     .default(Text("Cancelar"))
                  ])
               }
               Button {
                  save(image: imageData, context: context)
               } label: {
                  Text("guardar imagen")
               }
               
            }
         }
      }
   }
}
