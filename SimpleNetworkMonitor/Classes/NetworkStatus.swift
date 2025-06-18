//
//  NetworkStatus.swift
//  Pods
//
//  Created by nicolas bispo on 18/06/25.
//


import Foundation

@objc public enum NetworkStatus: Int {
    case connectedViaWiFi
    case connectedViaCellular
    case disconnected
    case unknown
}
