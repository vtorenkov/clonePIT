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

extension PitchCollectionViewCell: PlayerDelegate{
    func player(_ player: Player, didFailWithError error: Error?) {
        
    }
    
    func playerReady(_ player: Player) {
        self.player.view.frame = self.videoView.bounds
        self.loadingLabel.isHidden = true
        self.avatarImage.circleCorners()
        self.player.playFromCurrentTime()
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
    }
}

class PitchCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var priceView: UIView!
    fileprivate var player = Player()
    weak var item: ItemModel?
    
    @IBOutlet var removeOutlet: UIButton!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet var buttonBackGround: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var loadingLabel: UILabel!
    
    @IBOutlet var videoView: UIView!
    @IBOutlet var likeImage: UIImageView!
    @IBOutlet var priceTitle: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    weak var delegate: PitchCollectionInteract?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        priceView.clipsToBounds = true
        priceView.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            priceView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }

        //TODO: use another player:
        // https://github.com/newyjp/JPVideoPlayer
        self.player.view.frame = self.videoView.bounds
        self.player.playerDelegate = self
        self.videoView.addSubview(self.player.view)
        self.player.fillMode = PlayerFillMode.resizeAspectFill.avFoundationType
        self.videoView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if let item = self.item, !item.videoUrl.isEmpty {
            let url = URL.init(string: item.videoUrl)!
            self.player.url = url
            //self.player.stop()
            self.player.autoplay = true
            self.player.volume = 0.0
        }
        
        self.videoView.sendSubview(toBack: self.player.view)
        
        self.titleLabel.roundCorners()
        self.priceTitle.roundCorners()
        self.buttonBackGround.circleCorners()
        self.distanceLabel.roundCorners()
        
        self.titleLabel.font = UIFont.mainFonSFUItRegular(ofSize: 14)
        self.priceTitle.font = UIFont.mainFonSFUItBold(ofSize: 16)
        self.distanceLabel.font = UIFont.mainFonSFUItRegular(ofSize: 10)
        
        self.avatarImage.contentMode = .scaleAspectFill
        self.avatarImage.clipsToBounds = true
        
        if let seller = item?.author {
            if let url = seller.image {
                let url = URL(string: url)
                avatarImage.kf.setImage(with: url)
            } else {
                avatarImage.image = UIImage(named: "placeholder_avatar")
            }
            if seller.userId != UserManager.getCurrentUserObject().id {
                removeOutlet.removeFromSuperview()
            }
        }
        
        self.avatarImage.circleCorners()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func tapOnUser(_ sender: UIButton) {
        delegate?.showUser(with: item?.author.userId ?? "")
    }
    
    @IBAction func tapOnlike(_ sender: Any) {
        delegate?.tapOnLike(item: item)
    }
    
    @IBAction func removeItem(_ sender: UIButton) {
        
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

