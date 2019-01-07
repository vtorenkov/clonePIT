//
//  CellPhotosCollectionViewCell.swift
//  Rosenthal
//
//  Created by Jovmir Alexei on 12/28/17.
//  Copyright © 2017 Rosenthal. All rights reserved.
//

import UIKit
import Kingfisher
import Player

class PitchCollectionViewCell: UICollectionViewCell, NibReusable {
    
    fileprivate var player = Player()
    weak var item: ItemModel?

    @IBOutlet var buttonBackGround: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var loadingLabel: UILabel!
    
    @IBOutlet var likeImage: UIImageView!
    @IBOutlet var priceTitle: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    weak var delegate: PitchCollectionInteract?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.player.view.frame = self.contentView.frame
        self.contentView.addSubview(self.player.view)
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if let item = self.item, !item.videoUrl.isEmpty {
            let url = URL.init(string: item.videoUrl)!
            self.player.url = url
            //self.player.stop()
            self.player.autoplay = true
            self.player.volume = 0.0
        }
        self.contentView.sendSubview(toBack: self.player.view)
        self.contentView.sendSubview(toBack: self.loadingLabel)
        
        self.titleLabel.roundCorners()
        self.priceTitle.roundCorners()
        self.buttonBackGround.circleCorners()
        self.distanceLabel.roundCorners()
        
        self.titleLabel.font = UIFont.mainFonSFUItRegular(ofSize: 14)
        self.priceTitle.font = UIFont.mainFonSFUItBold(ofSize: 16)
        self.distanceLabel.font = UIFont.mainFonSFUItRegular(ofSize: 10)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func tapOnlike(_ sender: Any) {
        delegate?.tapOnLike(item: item)
    }
    
    static var reuseIdentifier: String { return "PitchCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "PitchCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
}

struct PitchCollectionViewCellModel {
    var item: ItemModel
    var delegate: PitchCollectionInteract?
}

extension PitchCollectionViewCellModel: CellViewModel {
    func setup(cell: PitchCollectionViewCell) {
        cell.item = item
        cell.priceTitle.text = "$" + item.price
        cell.titleLabel.text = item.title
        cell.delegate = delegate
    }
}


extension PitchCollectionViewCell {
    /*
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch (self.player.playbackState.rawValue) {
        case PlaybackState.stopped.rawValue:
            self.player.playFromBeginning()
            break
        case PlaybackState.paused.rawValue:
            self.player.playFromCurrentTime()
            break
        case PlaybackState.playing.rawValue:
            self.player.pause()
            break
        case PlaybackState.failed.rawValue:
            self.player.pause()
            break
        default:
            self.player.pause()
            break
        }
    }
 */
    
}

