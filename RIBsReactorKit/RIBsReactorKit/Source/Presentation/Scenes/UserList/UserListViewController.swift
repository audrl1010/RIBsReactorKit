//
//  UserListViewController.swift
//  RIBsReactorKit
//
//  Created by Elon on 2020/05/02.
//  Copyright © 2020 Elon. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import ReactorKit

enum UserListPresentableAction {
  case refresh
  case loadMore
  case itemSelected(IndexPath)
}

protocol UserListPresentableListener: class {
  var state: Observable<UserListState> { get }
}

final class UserListViewController:
  BaseViewController,
  UserListPresentable,
  UserListViewControllable
{
    
  // MARK: - Properties

  weak var listener: UserListPresentableListener?
  
  // MARK: - UI Components

  private var userListTableView = UITableView().then {
    $0.register(UserListCell.self)
  }
  
  // MARK: - Initialization & Deinitialization

  override init() {
    super.init()
    setTabBarItem()
  }
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: - Private methods
  
  private func setTabBarItem() {
    tabBarItem = UITabBarItem(
      title: "List",
      image: R.image.listTab(),
      selectedImage: nil
    )
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

private let deviceNames: [String] = [
  "iPhone SE",
  "iPhone 11 Pro Max"
]

@available(iOS 13.0, *)
struct UserListViewControllerPreview: PreviewProvider {

  static var previews: some SwiftUI.View {
    ForEach(deviceNames, id: \.self) { deviceName in
      UIViewControllerPreview {
        let viewController = UserListViewController()
        return UINavigationController(rootViewController: viewController)
      }
      .previewDevice(PreviewDevice(rawValue: deviceName))
      .previewDisplayName(deviceName)
    }
  }
}
#endif
