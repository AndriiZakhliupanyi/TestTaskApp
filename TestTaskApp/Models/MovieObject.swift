//
//  MovieObject.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import Foundation
import CoreData

@objc(MovieObject)
final class MovieObject: NSManagedObject {

    @nonobjc
    class func fetchRequest() -> NSFetchRequest<MovieObject> {
        return NSFetchRequest<MovieObject>(entityName: "MovieObject")
    }
    
    @NSManaged var id: String
    @NSManaged var rank: Int32
    @NSManaged var title: String
    @NSManaged var fullTitle: String
    @NSManaged var year: String
    @NSManaged var image: String
    @NSManaged var crew: String
    @NSManaged var imDbRating: String
    @NSManaged var imDbRatingCount: String
}

extension MovieObject: Identifiable {}
