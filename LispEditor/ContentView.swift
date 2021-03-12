//
//  ContentView.swift
//  LispEditor
//
//  Created by Breno on 11/03/21.
//

import SwiftUI
import SwiftLisp
import class SwiftLisp.Environment

struct ContentView: View {
  
  @State var contents: String = "(+ 1 2)\n(+ 3 4)"
  @State var message: String = "7"
  var env: Environment
  
  var body: some View {
    VStack {
      Spacer()
      
      CodeEditor(contents: $contents)
      
      Divider()
      
      Results(content: message)
        .padding()
      
      Spacer()
      
      HStack {
        Button("Run") {
          run(contents: contents)
        }.frame(width: 300, height: 50, alignment: .trailing)
      }
      
    }
  }
  
  func run(contents: String) {
    print("Received: \(contents)")
    
    do {
      let ast = try Parser.parse(contents)
      print("ast: \(ast)")
      
      for expr in ast {
        let result = try expr.eval(env)
        print(result)
        message = String(describing: result)
      }
    } catch let error {
      message = String(describing: error)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(env: try! loadBaseFiles())
  }
}
