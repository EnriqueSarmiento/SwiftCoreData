//
//  HomeView.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
   
   @Environment(\.managedObjectContext) var context
   @ObservedObject var model = MetasViewModel()
   
   //here we create a fetch request to coredate to retorn our metas data.
   @FetchRequest(entity: Metas.entity(), sortDescriptors: []) var metas: FetchedResults<Metas>
   
   //VARIABLES FOR SEARCH BAR
   @State var buscar: String = ""
   
    var body: some View {
       NavigationView{
          VStack{
             SearchBar(text: $buscar)
             List{
                ForEach(metas.filter {
                   buscar.isEmpty ? true : $0.titulo!.lowercased().contains(buscar.lowercased())
                }){ meta in
                   NavigationLink(destination: TareasView(meta: meta)) {
                      VStack(alignment: .leading) {
                         Text(meta.titulo ?? "")
                            .font(.title)
                         Text(meta.desc ?? "")
                            .font(.headline)
                      }
                   }
                   
                }.onDelete { (indexSet) in
                  let borrarMeta = metas[indexSet.first!]
                   model.deleteData(item: borrarMeta, context: context)
               
                }
             }
             NavigationLink(destination: AddMetaView()) {
                Image(systemName: "note")
             }
          }.navigationTitle("Metas")
       }
    }
}
