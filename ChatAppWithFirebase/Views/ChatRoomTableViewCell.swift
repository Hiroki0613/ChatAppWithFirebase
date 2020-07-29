//
//  ChatRoomTableViewCell.swift
//  ChatAppWithFirebase
//
//  Created by 近藤宏輝 on 2020/07/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    var message: Message? {
        didSet {
//            guard let text = messageText else { return }
//            let width = estimateFrameForTextView(text: text).width + 20
//            messageTextViewWithConstraint.constant = width
//            messageTextView.text = text
            if let message = message {
                messageTextView.text = message.message
                let width = estimateFrameForTextView(text: message.message).width + 20
                messageTextViewWithConstraint.constant = width
                
                dateLabel.text = dataFormatterForDateLabel(date: message.createdAt.dateValue())
//                userImageView.image = 
            }
            
        }
    }
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var messageTextView: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var messageTextViewWithConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        userImageView.layer.cornerRadius = 30
        messageTextView.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    private func estimateFrameForTextView(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
    }
    
    private func dataFormatterForDateLabel(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: date)
    }

}
