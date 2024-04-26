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
   
   //here we create a fetch request to coredate to retorn our metas data.
   @FetchRequest(entity: Metas.entity(), sortDescriptors: []) var metas: FetchedResults<Metas>
   
    var body: some View {
       NavigationView{
          VStack{
             List{
                ForEach(metas){ meta in
                   NavigationLink(destination: TareasView(meta: meta)) {
                      VStack(alignment: .leading) {
                         Text(meta.titulo ?? "")
                            .font(.title)
                         Text(meta.desc ?? "")
                            .font(.headline)
                      }
                   }
                   
                }
             }
             NavigationLink(destination: AddMetaView()) {
                Image(systemName: "note")
             }
          }.navigationTitle("Metas")
       }
    }
}
