//
//  DynamicHeightTableView.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 11/04/23.
//

import Foundation
import UIKit

class DynamicHeightTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
      }

      override var contentSize: CGSize {
        didSet{
          self.invalidateIntrinsicContentSize()
        }
      }

      override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
      }
}
