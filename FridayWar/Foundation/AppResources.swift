//
//  AppResources.swift
//  FridayWar
//
//  Created for SwiftPM resource loading.
//

import CoreData
import Foundation
import UIKit

enum AppResources {
    #if SWIFT_PACKAGE
    static let bundle = Bundle.module
    #else
    static let bundle = Bundle.main
    #endif

    static func image(named name: String) -> UIImage? {
        UIImage(named: name, in: bundle, compatibleWith: nil)
    }

    static func managedObjectModel(named name: String) -> NSManagedObjectModel? {
        let modelURLs = [
            bundle.url(forResource: name, withExtension: "momd"),
            bundle.url(forResource: name, withExtension: "mom")
        ].compactMap { $0 }

        for modelURL in modelURLs {
            if let model = NSManagedObjectModel(contentsOf: modelURL) {
                return model
            }
        }

        return NSManagedObjectModel.mergedModel(from: [bundle])
    }
}
