import Foundation

#if canImport(UIKit)
import UIKit
private let currentDevice = UIDevice.current.model
private let currentDeviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
#endif
#if canImport(AppKit)
import AppKit
private let currentDevice = Host.current().name ?? "Host"
private let currentDeviceID = Host.current().localizedName ?? "HostID"
#endif


public struct FlipperConnectionConfig {
    public let urlBase: String
    public let urlSession: URLSession
    
    public init(urlBase: String = "localhost:8333",
                urlSession: URLSession = .shared) {
        self.urlBase = urlBase
        self.urlSession = urlSession
    }
}

extension FlipperConnectionConfig {
    var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()
        items.append(.init(name: "os", value: FlipperConnectionConfig.osName))
        items.append(.init(name: "app", value: FlipperConnectionConfig.appName))
        items.append(.init(name: "device", value: FlipperConnectionConfig.deviceModel))
        items.append(.init(name: "device_id", value: FlipperConnectionConfig.version + currentDeviceID))
        return items
    }
    
    private static let version: String = {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
    }()
    
    private static let appName: String =  {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ??
        Bundle.main.bundleURL.lastPathComponent.components(separatedBy: ".").first!
    }()
    
    private static let deviceModel: String = {
        #if targetEnvironment(simulator)
            return "\(currentDevice) Simulator"
        #else
            return currentDevice
        #endif
    }()
    
    private static let osName: String = {
        #if os(iOS)
            return "iOS"
        #elseif os(watchOS)
            return "watchOS"
        #elseif os(tvOS)
            return "tvOS"
        #elseif os(macOS)
            return "macOS"
        #else
            return "Browser"
        #endif
    }()
}
