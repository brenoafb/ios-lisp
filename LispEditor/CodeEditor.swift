//
//  CodeEditor.swift
//  LispEditor
//
//  Created by Breno on 11/03/21.
//

import SwiftUI

struct CodeEditor: View {
  
  @Binding var contents: String
  
  var body: some View {
    TextEditor(text: $contents)
      .font(.system(.body, design: .monospaced))
      .keyboardType(.default)
      .disableAutocorrection(true)
      .autocapitalization(.none)
  }
}

//struct CodeEditor_Previews: PreviewProvider {
//  @State var contents: String = "(+ 1 (+ 2 3))"
//  static var previews: some View {
//    CodeEditor(contents: $contents)
//  }
//}
