//
//  StarsController.swift
//  Stars
//
//  Created by Ian French on 4/23/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import Foundation


class StarController   {
    
    init() { self.loadFromPersistentStore()
        
    }
    
    private(set) var stars: [Star] = []
  
    @discardableResult func createStar(with name: String, distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        self.saveToPersistentStore()
        return star
   
    
    }
    
    

    
    private var persistentFileURL: URL? {
    let fm = FileManager.default
        guard let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        return directory.appendingPathComponent("stars.plist")
        
        
        
        
    }
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
            
        } catch{
            NSLog("Error saving data: \(error)")
            
        }
    }
    
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return }
        
        do  {
           let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            NSLog("Error loading stars data: \(error)")
        }
    }


}
    
    
    
    
    
    
    
    
    

