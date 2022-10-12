//
//  ServiceManager.swift
//  20221011-KomalPatel-NYCSchools
//
//  Created by komal patel on 11/10/22.
//

import Foundation
import Network

let monitor = NWPathMonitor()
var isIntenetConnected = Bool()

func isInternetConnected() {
    monitor.pathUpdateHandler = { path in
        if path.status == .satisfied {
            print("We're connected!")
            isIntenetConnected = true
        } else {
            print("No connection.")
            isIntenetConnected = false
        }
        print(path.isExpensive)
    }
    let queue = DispatchQueue(label: "Monitor")
    monitor.start(queue: queue)
}
