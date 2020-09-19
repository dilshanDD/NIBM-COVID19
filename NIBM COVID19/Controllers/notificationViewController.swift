//
//  notificationViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class notificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
      

     notificationArray.append(NotificationModal(notificationImage: #imageLiteral(resourceName: "WhatsApp Image 2020-09-17 at 1.00.40 PM"), notificationMessage: "NIBM Closed until further notice"))
               
               view.backgroundColor = .black
               setTableView()
       
         }
    //MARK: - Properties
      let tableView = UITableView()
      var notificationArray = [NotificationModal]()
        
        
    
    // MARK: - Functions
    
    func setTableView()  {
        
        tableView.frame = self.view.frame
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        self.view.addSubview(tableView)
        tableView.backgroundColor = .black
        
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NotificationTableViewCell else {fatalError("Unable to create the cell")}
        cell.notificationImage.image = notificationArray[indexPath.row].notificationImage
        cell.notificatonLabel.text = notificationArray[indexPath.row].notificationMessage
                return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }

}

class NotificationModal{
    
    var notificationImage: UIImage?
    var notificationMessage: String?
    
    init(notificationImage: UIImage, notificationMessage: String ) {
        self.notificationImage = notificationImage
        self.notificationMessage = notificationMessage
    }
}

class NotificationTableViewCell: UITableViewCell {
    

    lazy var backView: UIView = {
        
        let view = UIView(frame: CGRect(x: 10, y: 6, width: UIScreen.main.bounds.size.width, height: 110))
        view.backgroundColor = .darkGray
        return view
    }()
    
    lazy var notificationImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 4, y: 6, width: 80, height: 80))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var notificatonLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 116, y: 40, width: backView.frame.width - 126, height: 30))
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Light" , size: 17)
        label.numberOfLines = 0
        label.textColor = .white
        return label
        
    }()
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(notificationImage)
        backView.addSubview(notificatonLabel)
 
        // Configure the view for the selected state
    }

}

