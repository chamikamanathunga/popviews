//
//  ContentView.swift
//  PopViews
//
//  Created by Elegantmedia on 2021-07-21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive : Bool = false
    
    var body: some View {
        NavigationView {
           VStack {
               Text("hello")
               NavigationLink(destination: ContentView2(rootIsActive: self.$isActive),
                              isActive: $isActive) { EmptyView() }
                   .isDetailLink(false)
            
                Button(action: {
                    self.isActive.toggle()
                }, label: {
                    Text("Hello World")
                })
           }
              
               .navigationBarTitle("Root")
       }
    }
}

struct ContentView2: View {
    @Binding var rootIsActive : Bool

    var body: some View {
        VStack {
            NavigationLink(destination: ContentView3(shouldPopToRootView: self.$rootIsActive)) {
            Text("Hello, World #2!")

            }
            .isDetailLink(false)
            .navigationBarTitle("Two")
            Button (
                action: {
                    self.rootIsActive = false
                    
                } )
            {
                Text("Pop to root")
            }

        }
    }
}

struct ContentView3: View {
    @Binding var shouldPopToRootView : Bool

    var body: some View {
        VStack {
            NavigationLink(destination: ContentView4(shouldPopToRootView: self.$shouldPopToRootView)) {
            Text("Hello, World #3!")

            }
//            Text("Hello, World #3!")
            Button (action: {
                self.shouldPopToRootView = false
            } ){
                Text("Pop to root")
            }
        }.navigationBarTitle("Three")
    }
}

struct ContentView4: View {
    @Binding var shouldPopToRootView : Bool

    var body: some View {
        VStack {
            Text("Hello, World #4!")
            Button (action: {
                self.shouldPopToRootView = false
            } ){
                Text("Pop to root")
            }
        }.navigationBarTitle("Three")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
