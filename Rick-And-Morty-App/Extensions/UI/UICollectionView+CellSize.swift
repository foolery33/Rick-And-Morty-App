//
//  UICollectionView+CellSize.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import UIKit

extension UICollectionView {
    func getSizeOfCell(
        insetsCollectionView insets: UIEdgeInsets,
        itemSpaceCollectionView itemSpace: CGFloat,
        itemsInRowCollectionView itemsInRow: Int,
        percentageOfHeightToWidthCell percentage: CGFloat
    ) -> CGSize {
        let sideInsets = insets.left + insets.right
        let insetsSum = itemSpace * (CGFloat(itemsInRow) - 1) + sideInsets
        let otherSpace = frame.width - insetsSum
        let cellWidth = otherSpace / CGFloat(itemsInRow)
        let cellHeight = cellWidth * percentage / 100

        return CGSize(width: cellWidth, height: cellHeight)
    }
}
