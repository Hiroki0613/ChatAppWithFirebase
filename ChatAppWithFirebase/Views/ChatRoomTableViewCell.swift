//
//  ChatRoomTableViewCell.swift
//  ChatAppWithFirebase
//
//  Created by 近藤宏輝 on 2020/07/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var messageTextView: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        userImageView.layer.cornerRadius = 30
        messageTextView.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
