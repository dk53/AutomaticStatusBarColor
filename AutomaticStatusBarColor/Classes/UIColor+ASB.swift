//
//  UIColor+ASB.swift
//  Pods
//
//  Created by Victor Carmouze on 23/01/2017.
//
//

import UIKit

extension UIColor {

    //https://www.w3.org/WAI/ER/WD-AERT/#color-contrast
    func isLight() -> Bool {

        let components = cgColor.components

        if let components = components {
            let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000

            return brightness > 0.5
        }

        return false
    }

    static func averageColor(fromImage image: UIImage?) -> UIColor {

        if let originalImage = image,
            let cgImage = originalImage.cgImage {
            var bitmap = [UInt8](repeating: 0, count: 4)

            let context = CIContext(options: nil)
            let cgImg = context.createCGImage(CoreImage.CIImage(cgImage: cgImage), from: CoreImage.CIImage(cgImage: cgImage).extent)

            let inputImage = CIImage(cgImage: cgImg!)
            let extent = inputImage.extent
            let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
            let filter = CIFilter(name: "CIAreaAverage", withInputParameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: inputExtent])!
            let outputImage = filter.outputImage!
            let outputExtent = outputImage.extent
            assert(outputExtent.size.width == 1 && outputExtent.size.height == 1)

            // Render to bitmap.
            context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: kCIFormatRGBA8, colorSpace: CGColorSpaceCreateDeviceRGB())

            // Compute result.
            let result = UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
            return result
            
        }
        return UIColor.white
    }
}
