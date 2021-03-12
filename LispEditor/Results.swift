//
//  Results.swift
//  LispEditor
//
//  Created by Breno on 11/03/21.
//

import SwiftUI

struct Results: View {
  
  var content: String
  var body: some View {
    ScrollView {
      VStack {
        Text(content)
          .lineLimit(nil)
          .font(.system(.body, design: .monospaced))
          .multilineTextAlignment(.leading)
      }.frame(maxWidth: .infinity)
    }
  }
  
}

struct Results_Previews: PreviewProvider {
  static var previews: some View {
    Results(content: "Hello!")
  }
}
