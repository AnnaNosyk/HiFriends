//
//  ConfiguringCell.swift
//  HiFriends
//
//  Created by Anna Nosyk on 17/06/2022.
//

import UIKit

protocol ConfiguringCell {
    static var idCell: String { get }
    func configure<U: Hashable>(with value: U)
}
