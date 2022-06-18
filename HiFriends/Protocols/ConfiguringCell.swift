//
//  ConfiguringCell.swift
//  HiFriends
//
//  Created by Anna Nosyk on 17/06/2022.
//

import UIKit

protocol ConfiguringCell {
    static var idCell: String { get }
    func configure(with value: HiChat)
}
