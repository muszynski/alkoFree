//
//  ContentView.swift
//  alkoFree
//
//  Created by Łukasz Muszyński on 05/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingModal = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button(action: {
                        self.isShowingModal.toggle()
                    }) {
                        Text("Wyświetl ekran modalny")
                    }
                    .sheet(isPresented: $isShowingModal) {
                        addDrinkig()
                    }
        }
        .padding()
        VStack{
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
