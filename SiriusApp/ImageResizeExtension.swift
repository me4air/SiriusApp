//
//  ImageResizeExtension.swift
//  SiriusApp
//
//  Created by Всеволод on 12/02/2019.
//  Copyright © 2019 me4air. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
func resizeImageWithQoulity(image: UIImage, maxHeight: Float = 300.0, maxWidth: Float = 300.0, compressionQuality: Float = 0.0) -> Data? {
    var actualHeight: Float = Float(image.size.height)
    var actualWidth: Float = Float(image.size.width)
    var imgRatio: Float = actualWidth / actualHeight
    let maxRatio: Float = maxWidth / maxHeight
    if actualHeight > maxHeight || actualWidth > maxWidth {
        if imgRatio < maxRatio {
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight
            actualWidth = imgRatio * actualWidth
            actualHeight = maxHeight
        }
        else if imgRatio > maxRatio {
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth
            actualHeight = imgRatio * actualHeight
            actualWidth = maxWidth
        }
        else {
            actualHeight = maxHeight
            actualWidth = maxWidth
        }
    }
    let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in:rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    let imageData = img?.jpegData(compressionQuality: CGFloat(compressionQuality))
    UIGraphicsEndImageContext()
    return imageData
}
}
