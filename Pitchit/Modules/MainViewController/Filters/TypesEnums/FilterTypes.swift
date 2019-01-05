//
//  FilterTypes.swift
//  Pitchit
//
//  Created by Alex on 12/11/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation

protocol BuilderModelProtocol: class {
    func buildModel(delegate: FilterTableItemDelegate) -> [CellViewAnyModel]
}

class BuilderModel: BuilderModelProtocol {
    var type: CategoryItemType
    
    init(type: CategoryItemType) {
        self.type = type
    }
    
    func buildModel(delegate: FilterTableItemDelegate) -> [CellViewAnyModel] {
        switch type {
            case .art:
                return self.buildArtModels(delegate: delegate)
            case .clothing:
                return self.buildArtModels(delegate: delegate)
////                return self.buildСlothingModels()
            case .electronics:
                return self.buildArtModels(delegate: delegate)
//                return self.buildElectronicsModels()
            case .homeandgarden:
                return self.buildArtModels(delegate: delegate)
//                return self.buildHomeandgardenModels()
            case .jewelry:
                return self.buildArtModels(delegate: delegate)
//                return self.buildJewelryModels()
            case .realestate:
                return self.buildArtModels(delegate: delegate)
//                return self.buildRealestateModels()
            case .services:
                return self.buildArtModels(delegate: delegate)
//                return self.buildServicesModels()
            case .sports:
                return self.buildArtModels(delegate: delegate)
//                return self.buildSportsModels()
            case .vehicles:
                return self.buildArtModels(delegate: delegate)
//                return self.buildVehiclesModels()
        }
    }
    
    fileprivate func buildVehiclesModels() -> [CellViewAnyModel] {
        return [RangeTableViewCellModel(type: .sizeFootWear)]
    }
    
    fileprivate func buildArtModels(delegate: FilterTableItemDelegate) -> [CellViewAnyModel] {
        return [SelectTypesTableViewCellModel(type: .vehicles, delegate: delegate),
                RangeTableViewCellModel(type: .year),
                RangeTableViewCellModel(type: .mileage),
                RangeTableViewCellModel(type: .sizeFootWear),
                LocationTableViewCellModel(),
                SortByTableViewCellModel(),
                SelectTypesTableViewCellModel(type: .clothing, delegate: delegate),
                SelecterTableViewCellModel(),
                RangeMinusPlusButtonsTableViewCellModel(),
                SelectTypesTableViewCellModel(type: .realestate, delegate: delegate),
                ShowResultsTableViewCellModel()
        ]
    }
    
    fileprivate func buildСlothingModels() -> [CellViewAnyModel] {
        return [RangeTableViewCellModel(type: .sizeFootWear)]
    }
    
    fileprivate func buildElectronicsModels() -> [CellViewAnyModel] {
        return [SortByTableViewCellModel()]
    }
    
    fileprivate func buildHomeandgardenModels() -> [CellViewAnyModel] {
        return [SortByTableViewCellModel()]
    }
    
    fileprivate func buildJewelryModels() -> [CellViewAnyModel] {
        return [SelecterTableViewCellModel()]
    }
    
    fileprivate func buildRealestateModels() -> [CellViewAnyModel] {
        return [ShowResultsTableViewCellModel()]
    }
    
    fileprivate func buildServicesModels() -> [CellViewAnyModel] {
        return [LocationTableViewCellModel()]
    }
    
    fileprivate func buildSportsModels() -> [CellViewAnyModel] {
        return [LocationTableViewCellModel()]
    }
}
