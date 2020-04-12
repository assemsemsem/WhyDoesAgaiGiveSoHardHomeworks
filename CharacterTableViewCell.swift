//
//  CharacterTableViewCell.swift
//  TheBigBigProblem
//
//  Created by Assem on 4/12/20.
//  Copyright © 2020 Assem. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var picImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    

    @IBOutlet weak var statusLabel: UILabel!
    
    var charDetail: String = ""
      
      var character: Character! {
          didSet{
              updateUI()
          }
      }
      
      
      func updateUI(){
          self.nameLabel.text = character.name
          self.statusLabel.text = character.status
          self.charDetail = character.charUrl
          
        ImageService.shared.downloadImages(url: character.picURL) { image in
            self.picImageView.image = image
        }
          
      }
}
