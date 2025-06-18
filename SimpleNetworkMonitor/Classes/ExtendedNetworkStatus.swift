public struct ExtendedNetworkStatus {
    public let connectionType: String
    public let isWiFi: Bool
    public let isCellular: Bool
    // outras propriedades...

    public init(from status: NetworkStatus) {
        switch status {
        case .connectedViaWiFi:
            connectionType = "wifi"
            isWiFi = true
            isCellular = false
        case .connectedViaCellular:
            connectionType = "cellular"
            isWiFi = false
            isCellular = true
        default:
            connectionType = "unknown"
            isWiFi = false
            isCellular = false
        }
        // preencha os outros com valores default ou reais se puder medir
    }
}
