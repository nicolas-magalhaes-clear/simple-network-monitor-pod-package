import Foundation
import Network

public class NetworkMonitor {

    public static let shared = NetworkMonitor()

    public weak var delegate: NetworkMonitorDelegate?

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)

    private(set) public var currentStatus: NetworkStatus = .unknown

    private init() {}

    public func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            let status: NetworkStatus

            if path.status == .satisfied {
                if path.usesInterfaceType(.wifi) {
                    status = .connectedViaWiFi
                } else if path.usesInterfaceType(.cellular) {
                    status = .connectedViaCellular
                } else {
                    status = .unknown
                }
            } else {
                status = .disconnected
            }

            if status != self.currentStatus {
                self.currentStatus = status

                DispatchQueue.main.async {
                    self.delegate?.networkStatusDidChange(status)

                    let extendedStatus = ExtendedNetworkStatus(from: status) // ✅ Correto: 'NetworkStatus' passado
                    NotificationCenter.default.post(
                        name: .networkStatusDidChange,
                        object: extendedStatus.toDictionary()
                    )
                }
            }
        }

        monitor.start(queue: queue)
    }

    public func stopMonitoring() {
        monitor.cancel()
    }
}
