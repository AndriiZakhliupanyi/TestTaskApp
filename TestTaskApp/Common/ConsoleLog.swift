//
//  ConsoleLog.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation

func consoleLog(_ items: Any...) {
    #if DEBUG
        let output = "ConsoleLog: " + items.map({ "\($0)" }).joined(separator: " ")
        // swiftlint:disable:next debugprint_usage
        debugPrint(output)
    #endif
}
