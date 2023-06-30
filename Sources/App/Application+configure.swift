import Hummingbird
import HummingbirdFoundation
import Foundation

public protocol AppArguments {
    var path: String { get }
}

extension HBApplication {
    
    func configure(_ args: AppArguments) async throws {
//        logger.logLevel = .warning
        
        let home = FileManager.default.homeDirectoryForCurrentUser.path
        var publicPath = args.path.replacingOccurrences(of: "~", with: home)
        
        if publicPath.hasPrefix(".") {
            publicPath = FileManager.default.currentDirectoryPath + "/" + publicPath
        }

        middleware.add(
            HBFileMiddleware(
                publicPath,
                searchForIndexHtml: true,
                application: self
            )
        )
    }
}
