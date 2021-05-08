//
//  NSManagedObject+Helper.swift
//  NewsPaper
//
//  Created by RodaDev on 04.04.2021.
//

import MagicalRecord

extension NSManagedObject {
    static func createEntity<T:NSManagedObject> (keysValues: [String : Any],
                                                 shouldSave: Bool,
                                                 context: NSManagedObjectContext = .mr_rootSaving()) -> T? {
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
    
    func delete() {
        let context = managedObjectContext
        mr_deleteEntity()
        context?.mr_saveToPersistentStoreAndWait()
    }
}
