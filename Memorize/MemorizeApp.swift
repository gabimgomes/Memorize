//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Gabriela Martins Gomes on 13/01/25.
//

import SwiftUI
import SwiftData

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel:game)
        }
        .modelContainer(sharedModelContainer)
    }
}
