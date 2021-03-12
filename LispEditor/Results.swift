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
      }.frame(maxWidth: .infinity)
    }
  }
  
}

struct Results_Previews: PreviewProvider {
  static var previews: some View {
    Results(content: "Hello!")
  }
}
