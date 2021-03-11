//
//  ContentView.swift
//  LispEditor
//
//  Created by Breno on 11/03/21.
//

import SwiftUI

struct ContentView: View {
  
  @State var contents: String = ""
  @State var message: String = ""
  var env = loadBaseFiles()!
  
  var body: some View {
    VStack {
      Spacer()
      CodeEditor(contents: $contents)
      Text(message)
        .padding()
      Spacer()
      Button("Run") {
        run(contents: contents)
      }
    }
  }
  
  func run(contents: String) {
    print("Received: \(contents)")
    guard let ast = Parser.parse(contents) else {
      message = "parse error"
      return
    }
    
    for expr in ast {
      guard let result = expr.eval(env) else {
        message = "eval error"
        return
      }
      message = String(describing: result)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
