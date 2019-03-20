//
//  MainPresenter.swift
//  Pitchit
//
//  Created by Alex on 7/7/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation


class MainPresenter: NSObject, Presenter {
    
    typealias PresenterView = MainViewController
    
    weak var view: PresenterView!
    
    fileprivate let service: MainViewClient!
    
    required init(view: PresenterView, service: MainViewClient = MainViewManager()) {
        self.view = view
        self.service = service
    }
    
    func getPosts() {
        var items = [ItemModel]()
        self.service.getPosts { [weak self] (itemsCodable, response) in
            itemsCodable?.forEach{items.append(ItemModel(codableItem: $0))}
            self?.view.items = items
            self?.view.pitchCollectionViewDelegate?.items = items
            self?.view.pitchCollectionViewDatasource?.items = items
            self?.view.pitchCollection.reloadData()
        }
    }
}
