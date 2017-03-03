//
//  HomeDatasource.swift
//  QRMarks
//
//  Created by Harry Wright on 28/02/2017.
//  Copyright © 2017 Off Piste. All rights reserved.
//

import UIKit
import HWCollectionView

class HomeDatasource: CollectionViewDatasource {
    
    required init(withCollectionView collectionView: UICollectionView) {
        super.init(withCollectionView: collectionView)
        
        print(#function)
    }
    
    required init(withCollectionView collectionView: UICollectionView, _ objects: [Any]) {
        super.init(withCollectionView: collectionView, objects)
        
        print(#function)
    }
    
    override func cellClasses() -> [CollectionViewCell.Type] {
        print(#function)
        
        return [IBCollectionViewCell.self]
    }
    
    override func numberOfItems(in section: Int) -> Int {
        print(#function)
        
        if controller == nil { return objects?.count ?? 0 }
        
        if !(controller?.isSearching)! {
            return objects?.count ?? 0
        } else {
            return filteredObjects?.count ?? 0
        }
    }
    
    override func item(at indexPath: IndexPath) -> Any? {
        print(#function)
        
        if controller == nil { return objects?[indexPath.item] }
        
        if !(controller?.isSearching)! {
            if filteredObjects?.count == 0 {
                return nil
            }
            
            return filteredObjects?[indexPath.item] ?? nil
        } else {
            return objects?[indexPath.item]
        }
    }
    
}
