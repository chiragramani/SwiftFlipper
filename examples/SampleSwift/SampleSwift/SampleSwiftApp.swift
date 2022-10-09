import SwiftUI
import SwiftFlipper

@main
struct SampleSwiftApp: App {
    private let gameController = GameController()
    private let flipperClient = FlipperClient(connectionConfig: FlipperConnectionConfig(),
                                              plugins: [])
    
    init() {
        flipperClient.addPlugin(RCLoggerPlugin())
        flipperClient.addPlugin(NetworkPlugin(networkAdapter: FlipperNetworkAdapter()))
        flipperClient.addPlugin(UserDefaultsPlugin(suiteName: nil))
        flipperClient.addPlugin(TicTacToePlugin(gameController: gameController))
        flipperClient.addPlugin(ExamplePlugin.shared)
        flipperClient.connectToFlipper()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(gameController: gameController)
        }
    }
}
