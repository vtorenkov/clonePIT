//
//  UploadVideoTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/14/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import AVFoundation

class UploadVideoTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var buttonBackGround: UILabel!
    @IBOutlet var gradientView: UIView!

    weak var item: ItemModel?
    weak var delegate: PostItemTableItemDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        self.labelDuration.roundCorners()
        self.buttonBackGround.circleCorners()
            
        if let layers = self.gradientView.layer.sublayers {
            layers.forEach{$0.removeFromSuperlayer()}
        }
        self.gradientView.addGradient()
    }
    
    @IBAction func addVideo(_ sender: Any) {
        self.delegate?.addVideoToItem()
    }
    
    @IBOutlet var thumbIMage: UIImageView!
    @IBOutlet var labelDuration: PaddingLabel!

    func setBackGround() {
        if let item = self.item, !item.videoUrl.isEmpty {

            do {
                
                let asset = AVURLAsset(url: URL(fileURLWithPath: item.videoUrl) , options: nil)
                let duration = asset.duration
                let durationTime = CMTimeGetSeconds(duration)

                let (_,m,s) = Int(durationTime).secondsToHoursMinutesSeconds()
                self.labelDuration.isHidden = false
                self.labelDuration.text = "Duration \(m):\(s)"
                let imgGenerator = AVAssetImageGenerator(asset: asset)
                imgGenerator.appliesPreferredTrackTransform = true
                let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
                let thumbnail = UIImage(cgImage: cgImage)
                thumbIMage.contentMode = .scaleAspectFill
                thumbIMage.clipsToBounds = true
                thumbIMage.image = thumbnail

            } catch let error {
                
                print("*** Error generating thumbnail: \(error.localizedDescription)")
                
            }
        }
    }
    
    static var reuseIdentifier: String { return "UploadVideoTableViewCell" }
    static var nib: UINib { return UINib(nibName: "UploadVideoTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct UploadVideoTableViewCellModel {
    var type: AddItemCellType
    var delegate: PostItemTableItemDelegate
    var item: ItemModel?
}

extension UploadVideoTableViewCellModel: CellViewModel {
    func setup(cell: UploadVideoTableViewCell) {
        cell.labelDuration.isHidden = true

        cell.delegate = delegate
        cell.item = item
        cell.setBackGround()
        
    }
}
