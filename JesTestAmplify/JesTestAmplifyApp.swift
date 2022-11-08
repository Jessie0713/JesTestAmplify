//
//  JesTestAmplifyApp.swift
//  JesTestAmplify
//
//  Created by 許湘潔 on 2022/11/8.
//

import SwiftUI
import Amplify
import AWSAPIPlugin
import AWSCognitoAuthPlugin

@main
struct JesTestAmplifyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    init() {
            do {
                try Amplify.add(plugin: AWSCognitoAuthPlugin())
                try Amplify.add(plugin: AWSAPIPlugin())
                try Amplify.configure()
                print("Amplify configured with API and Auth plugin")
            } catch {
                print("Failed to initialize Amplify with \(error)")
            }
        }
}
