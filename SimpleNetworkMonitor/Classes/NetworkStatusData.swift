//
//  NetworkStatusData.swift
//  Pods
//
//  Created by nicolas bispo on 18/06/25.
//
import Foundation

@objcMembers
public class NetworkStatusData: NSObject {
    public let connectionType: String
    public let isCellular: Bool
    public let isWiFi: Bool
    public let isEthernet: Bool
    public let latency: Double
    public let packetLoss: Double
    public let isVPN: Bool
    public let isAirplaneMode: Bool
    public let isLowPowerMode: Bool
    public let isRoaming: Bool

    public init(
        connectionType: String = "unknown",
        isCellular: Bool = false,
        isWiFi: Bool = false,
        isEthernet: Bool = false,
        latency: Double = 0.0,
        packetLoss: Double = 0.0,
        isVPN: Bool = false,
        isAirplaneMode: Bool = false,
        isLowPowerMode: Bool = false,
        isRoaming: Bool = false
    ) {
        self.connectionType = connectionType
        self.isCellular = isCellular
        self.isWiFi = isWiFi
        self.isEthernet = isEthernet
        self.latency = latency
        self.packetLoss = packetLoss
        self.isVPN = isVPN
        self.isAirplaneMode = isAirplaneMode
        self.isLowPowerMode = isLowPowerMode
        self.isRoaming = isRoaming
    }

    public func toDict() -> [String: Any] {
        return [
            "connectionType": connectionType,
            "isCellular": isCellular,
            "isWiFi": isWiFi,
            "isEthernet": isEthernet,
            "latency": latency,
            "packetLoss": packetLoss,
            "isVPN": isVPN,
            "isAirplaneMode": isAirplaneMode,
            "isLowPowerMode": isLowPowerMode,
            "isRoaming": isRoaming
        ]
    }
}


