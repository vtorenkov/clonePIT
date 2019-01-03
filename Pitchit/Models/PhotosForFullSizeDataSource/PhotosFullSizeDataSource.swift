//
//  PhotosFullSizeDataSource.swift
//  Pitchit
//
//  Created by Alex on 10/27/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import NYTPhotoViewer

class Photo: NSObject, NYTPhoto {
    var image: UIImage?
    
    init(image: UIImage? = nil) {
        self.image = image
    }
    
    var imageData: Data?
    
    var placeholderImage: UIImage?
    
    var attributedCaptionTitle: NSAttributedString?
    
    var attributedCaptionSummary: NSAttributedString?
    
    var attributedCaptionCredit: NSAttributedString?
}

class DataSource: NSObject, NYTPhotoViewerDataSource{
    var photos = [Photo(image: nil)]
    
    convenience init(image: UIImage?) {
        self.init()
        let photo = Photo()
        photo.image = image
        self.photos.removeAll()
        photos.append(photo)
    }
    
    @objc
    var numberOfPhotos: NSNumber? {
        return NSNumber(integerLiteral: photos.count)
    }
    @objc
    func index(of photo: NYTPhoto) -> Int {
        return 0
    }
    
    func photo(at photoIndex: Int) -> NYTPhoto? {
        return photos[photoIndex]
    }
}
