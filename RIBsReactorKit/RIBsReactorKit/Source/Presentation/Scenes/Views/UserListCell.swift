//
//  UserListCell.swift
//  RIBsReactorKit
//
//  Created by Elon on 2020/05/06.
//  Copyright © 2020 Elon. All rights reserved.
//

import UIKit

import Then
import Kingfisher
import SnapKit

class UserListCell: BaseTableViewCell {
  
  // MARK: - Properties
  
  private var userModel: UserModel? {
    didSet {
      
    }
  }
  
  // MARK: - UI Components
  
  private let userImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
  }
  
  private let userNameLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 17, weight: .medium)
  }
  
  // MARK: - Inheritance

  override func initialize() {
    super.initialize()
    let views = [
      userImageView,
      userNameLabel
    ]
    views.forEach { addSubview($0) }
  }

  override func setupConstraints() {
    
  }
  
}
