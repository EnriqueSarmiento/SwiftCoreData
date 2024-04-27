//
//  SearchBar.swift
//  SwiftCoreData
//
//  Created by Enrique Sarmiento on 27/4/24.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
   
   @Binding var text: String
   
   func makeCoordinator() -> SearchBar.Coordinator {
      return Coordinator.init(text: $text)
   }
   
   func makeUIView(context: Context) -> UISearchBar {
      let searchBar = UISearchBar(frame: .zero)
      searchBar.delegate = context.coordinator
      return searchBar
   }
   
   func updateUIView(_ uiView: UISearchBar, context: Context) {
      uiView.text = text
   }
   
   class Coordinator: NSObject, UISearchBarDelegate {
      @Binding var text : String
      
      init(text: Binding<String>) {
         // in this class we canot assign the text with self because we are declaring the variable con Binding, therefore we use _VARIABLE_NAME
         //self.text = text
         _text = text
      }
      
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         text = searchText
      }
   }
   
   
}
