//
//  ContentView.swift
//  JesTestAmplify
//
//  Created by 許湘潔 on 2022/11/8.
//

import SwiftUI
import Amplify


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .task {
                    await postTodo()
                    // 非同步函數需用task 加上 await
                    
                }
        }
        .padding()
    }
    func postTodo() async {
        let message = #"{"n": "hi"}"#
        let request = RESTRequest(path: "/todo", body: message.data(using: .utf8))
        do {
            let data = try await Amplify.API.post(request: request)
            let str = String(decoding: data, as: UTF8.self)
            print("Success: \(str)")
        } catch let error as APIError {
            print("Failed due to API error: ", error)
        } catch {
            print("Unexpected error: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
