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
      .multilineTextAlignment(.leading)
  }
}

struct CodeEditor_Previews: PreviewProvider {
  
  static var previews: some View {
    PreviewWrapper()
  }

  struct PreviewWrapper: View {
    @State(initialValue: "(+ (+ 1 2)\n   (+ 2 3))\n(+ 2 3)") var code: String

    var body: some View {
      VStack {
        Spacer(minLength: 300)
        CodeEditor(contents: $code)
        Spacer(minLength: 300)
      }
        
    }
  }
}
