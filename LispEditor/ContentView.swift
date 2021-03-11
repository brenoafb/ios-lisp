//
//  ContentView.swift
//  LispEditor
//
//  Created by Breno on 11/03/21.
//

import SwiftUI

struct ContentView: View {
  
  @State var contents: String = "Contents"
  
  var body: some View {
    VStack {
      Spacer()
      TextEditor(text: $contents)
      Text(contents)
        .padding()
      Spacer()
      Button("Run") {
        run(contents: contents)
      }
    }
  }
  
  func run(contents: String) {
    print("Received: \(contents)")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
