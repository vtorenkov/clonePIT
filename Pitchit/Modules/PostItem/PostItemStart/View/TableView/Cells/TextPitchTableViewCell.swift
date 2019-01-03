//
//  TextPitchTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/14/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import GooglePlaces
import SearchTextField

class TextPitchTableViewCell: UITableViewCell, NibReusable, UITextFieldDelegate {
    var findPlaces = [GMSPlace]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    
    weak var item: ItemModel?
    var typeText: AddItemCellType?

    @IBOutlet var textField: SearchTextField!
    @IBOutlet var textCellTitle: UILabel!
    
    static var reuseIdentifier: String { return "TextPitchTableViewCell" }
    static var nib: UINib { return UINib(nibName: "TextPitchTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let iT = self.item, let text = textField.text, let type = self.typeText {
            switch type {
                case .nameText:
                    iT.title = text
                case .priceText:
                    iT.price = text
                case .locationText:
                    iT.place = text
                default: break
            }
        }
    }
}

struct TextPitchTableViewCellModel {
    var type: AddItemCellType
    var item: ItemModel?
}

extension TextPitchTableViewCellModel: CellViewModel {
    func setup(cell: TextPitchTableViewCell) {
        cell.item = item
        cell.typeText = type

        switch type {
        case .nameText:
            cell.textField.placeholder = "Wooden rockin chair"
            cell.textCellTitle.text = "Item Name"
            cell.textField.delegate = cell
        case .priceText:
            cell.textField.placeholder = "0.0$"
            cell.textField.keyboardType = .numberPad
            cell.textCellTitle.text = "Set the price"
            cell.textField.delegate = cell
        case .locationText:
            cell.textField.placeholder = "Enter Address"
            cell.textCellTitle.text = "Item location"
            
            cell.textField.itemSelectionHandler = { filteredResults, itemPosition in
                // Just in case you need the item position
                let item = filteredResults[itemPosition]
                cell.textField.text = item.title

                if let index = cell.findPlaces.index(where: {$0.formattedAddress == item.title}) {
                    let place = cell.findPlaces[index]
                    if let iT = self.item {
                        iT.place = place.formattedAddress!
                        iT.placeCoodinate = place.coordinate
                    }
                }
            }
            
            cell.textField.userStoppedTypingHandler = {
                if let text = cell.textField.text {
                    cell.placeAutocompleteAdress(string: text)
                    if let iT = self.item {
                        iT.place = text
                    }
                }
            }
            
            
        default: break
        }
    }
}


extension TextPitchTableViewCell {
    func placeAutocompleteAdress(string:String) {
        self.findPlaces.removeAll()
        let filter = GMSAutocompleteFilter()
        //filter.type = .city
        //filter.country = "usa"
        filter.type = .address
        var stringFindplaces = [String]()
        let placesClient = GMSPlacesClient()
        placesClient.autocompleteQuery(string, bounds: nil, filter: filter) { (results, error:Error?) -> Void in
            if results == nil {
                return
            }
            for searchresult in results!{
                
                if let result = searchresult as? GMSAutocompletePrediction{
                    placesClient.lookUpPlaceID(result.placeID!, callback: { (gplace: GMSPlace?, error: Error?) -> Void in
                        if let error = error {
                            print("lookup place id query error: \(error.localizedDescription)")
                            return
                        }
                        
                        if let place = gplace {
                            print("place result")
                            print(place)
                            
                            let placeG = PlaceGoogle()
                            placeG.lon = place.coordinate.longitude
                            placeG.lat = place.coordinate.latitude
                            placeG.placeId = place.placeID
                            placeG.gymName = place.name
                            self.findPlaces.append(place)
                            stringFindplaces.append(place.formattedAddress!)
                            
                            
                        } else {
                            print("No place details for \(gplace)")
                        }
                        self.textField.filterStrings(stringFindplaces)
                        
                    })
                    
                    
                }
            }
            //set here google place string
        }
    }
}




class PlaceGoogle {
    var lon: Double = 0.0
    var lat: Double = 0.0
    
    var placeId = ""
    var gymName = ""
}
