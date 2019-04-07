//
//  UserCarUsTableViewCell.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import UIKit
import Player

class VideoTableViewCell: UITableViewCell, NibReusable {
    fileprivate var player = Player()
    weak var item: ItemModel?
    @IBOutlet var loadingLabel: UILabel!
    
    @IBOutlet var itemNameOutlet: UILabel!
    @IBOutlet var buttonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.player.view.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        //self.contentView.frame
        self.contentView.addSubview(self.player.view)
        self.contentView.bringSubview(toFront: buttonView)
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.selectionStyle = .none
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
        self.contentView.bringSubview(toFront: loadingLabel)
        self.loadingLabel.text = "  Play  "
        loadingLabel.roundCorners()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.player.fillMode = PlayerFillMode.resizeAspectFill.avFoundationType
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    var delegate: ItemDetailsTableItemDelegate?

//    @IBAction func iquireAction(_ sender: Any) {
//        self.delegate?.tapOnImquire()
//    }
    
    static var reuseIdentifier: String { return "VideoTableViewCell" }
    static var nib: UINib { return UINib(nibName: "VideoTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct VideoTableViewCellModel {
    var item: ItemModel?
    var delegate: ItemDetailsTableItemDelegate
}

extension VideoTableViewCellModel: CellViewModel {
    func setup(cell: VideoTableViewCell) {
        cell.item = item
        cell.delegate = delegate

        if let item = cell.item, !item.videoUrl.isEmpty {
            let url = URL.init(string: item.videoUrl)!
            cell.player.url = url
            cell.player.stop()
            cell.player.autoplay = false
        }
        
        if let item = cell.item {
            cell.itemNameOutlet.text = item.title
        }
    }
}

extension VideoTableViewCell {
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch (self.player.playbackState.rawValue) {
        case PlaybackState.stopped.rawValue:
            self.loadingLabel.text = "  Stop  "
            self.player.playFromBeginning()
            break
        case PlaybackState.paused.rawValue:
            self.loadingLabel.text = "  Stop  "
            self.player.playFromCurrentTime()
            break
        case PlaybackState.playing.rawValue:
            self.loadingLabel.text = "  Play  "
            self.player.pause()
            break
        case PlaybackState.failed.rawValue:
            self.loadingLabel.text = "  Play  "
            self.player.pause()
            break
        default:
            self.player.pause()
            break
        }
    }
}
