import Foundation

public protocol NetworkMonitorDelegate: AnyObject {
    func networkStatusDidChange(_ status: NetworkStatus)
}
