//
//  NSManagedObject+Helper.swift
//  NewsPaper
//
//  Created by RodaDev on 04.04.2021.
//

import MagicalRecord

extension NSManagedObject {
    static func createEntity<T:NSManagedObject> (keysValues: [String : Any], shouldSave: Bool) -> T? {
        let context = NSManagedObjectContext.mr_rootSaving()
        let createEntity = T.mr_createEntity(in: context)
        for (key, value) in keysValues {
            if createEntity?.entity.attributesByName.keys.contains(key) ?? false {
                createEntity?.setValue(value, forKeyPath: key)
            }
        }
        
        if shouldSave {
            context.mr_saveToPersistentStoreAndWait()
        }
        
        return createEntity
    }
}
