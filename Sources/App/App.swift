import ArgumentParser
import Hummingbird
import Foundation

@main
struct App: AsyncParsableCommand, AppArguments {
    
    @Argument(help: "The path of the files")
    var path: String = "."
    
    @Option(name: .shortAndLong)
    var hostname: String = "127.0.0.1"

    @Option(name: .shortAndLong)
    var port: Int = 8080
    
    @Option(name: .shortAndLong)
    var name: String = "Swift server"
    
    func run() async throws {
        setenv("LOG_LEVEL", "warning", 1)
        
        let app = HBApplication(
            configuration: .init(
                address: .hostname(hostname, port: port),
                serverName: name
            )
        )
        try await app.configure(self)
        try app.start()
        app.wait()
    }
}
