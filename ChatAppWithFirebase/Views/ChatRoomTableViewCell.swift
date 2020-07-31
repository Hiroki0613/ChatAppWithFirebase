//
//  ChatRoomTableViewCell.swift
//  ChatAppWithFirebase
//
//  Created by 近藤宏輝 on 2020/07/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit
import FirebaseAuth
import Nuke

class ChatRoomTableViewCell: UITableViewCell {
    
    var message: Message? {
        didSet {
//            guard let text = messageText else { return }
//            let width = estimateFrameForTextView(text: text).width + 20
//            messageTextViewWithConstraint.constant = width
//            messageTextView.text = text
//            if let message = message {
//                partnerMessageTextView.text = message.message
//                let width = estimateFrameForTextView(text: message.message).width + 20
//                messageTextViewWithConstraint.constant = width
//
//                partnerDateLabel.text = dataFormatterForDateLabel(date: message.createdAt.dateValue())
////                userImageView.image =
//            }
            
        }
    }
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var partnerMessageTextView: UITextView!
    @IBOutlet var myMessageTextView: UITextView!
    @IBOutlet var partnerDateLabel: UILabel!
    @IBOutlet var myDateLabel: UILabel!
    
    @IBOutlet var messageTextViewWithConstraint: NSLayoutConstraint!
    @IBOutlet var myMessageTextViewWithConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
        userImageView.layer.cornerRadius = 30
        partnerMessageTextView.layer.cornerRadius = 15
        myMessageTextView.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkWhichUserMessage()
    }
    
    private func checkWhichUserMessage() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        if uid == message?.uid {
            partnerMessageTextView.isHidden = true
            partnerDateLabel.isHidden = true
            userImageView.isHidden = true
            
            myMessageTextView.isHidden = false
            myDateLabel.isHidden = false
            
            if let message = message {
                myMessageTextView.text = message.message
                let width = estimateFrameForTextView(text: message.message).width + 20
                myMessageTextViewWithConstraint.constant = width
                
                myDateLabel.text = dataFormatterForDateLabel(date: message.createdAt.dateValue())
            }
            
        } else {
            partnerMessageTextView.isHidden = false
            partnerDateLabel.isHidden = false
            userImageView.isHidden = false
            
            myMessageTextView.isHidden = true
            myDateLabel.isHidden = true
            if let urlString = message?.partnerUser?.profileImageUrl, let url = URL(string: urlString) {
                Nuke.loadImage(with: url, into: userImageView)
            }
            
            if let message = message {
                partnerMessageTextView.text = message.message
                let width = estimateFrameForTextView(text: message.message).width + 20
                messageTextViewWithConstraint.constant = width
                
                partnerDateLabel.text = dataFormatterForDateLabel(date: message.createdAt.dateValue())
            }
            
        }
    }
    
    
    private func estimateFrameForTextView(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
    private func dataFormatterForDateLabel(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: date)
    }

}
