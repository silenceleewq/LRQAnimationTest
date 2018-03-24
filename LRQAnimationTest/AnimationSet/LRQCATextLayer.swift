//
//  LRQCATextLayer.swift
//  LRQAnimationTest
//
//  Created by lirenqiang on 24/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

/*
    使用 CATextLayer 来显示一些文字
 */
import UIKit
import CoreGraphics
import CoreFoundation
/*
class LayerLabel: UILabel {
    
     override class var layerClass: AnyClass {
        get {
            return CATextLayer.self
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var text: String? {
        set {
            super.text = newValue
            textLayer.string = text
        }
        get {
            return textLayer.string
        }
    }
}
*/
// textlayer setup
//extension LayerLabel {
//
//    var textLayer: CATextLayer {
//        get {
//            return layer as! CATextLayer
//        }
//    }
//
//    func setup() -> Void {
//        //set defaults from UILabel settings
////        text = text
////        textColor = textColor
////        font = font
//
//        //we should really derive these from the UILabel settings too
//        //but that's complicated, so for now we'll just hard-code them
//        textLayer.alignmentMode = kCAAlignmentJustified
//        textLayer.isWrapped = true
//        layer.display()
//    }
//}

public class LRQCATextLayer: LRQBaseViewController {

    var labelView: UIView = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(labelView)
        labelView.backgroundColor = UIColor.clear
        createLabel()
        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//create LayerLabel
extension LRQCATextLayer {
    
}

//textLayer extension
extension LRQCATextLayer {
    func createLabel() {
        let textLayer = CATextLayer.init()
        textLayer.frame = labelView.bounds
        textLayer.contentsScale = UIScreen.main.scale
        labelView.layer.addSublayer(textLayer)
        
        // set text attributes
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.isWrapped = true
        
        //choose a font
        let font = UIFont.systemFont(ofSize: 15)
        
        //set layer font
        let fontName: CFString = font.fontName as CFString
        let fontRef: CGFont = CGFont(fontName)!
        textLayer.font = fontRef
        textLayer.fontSize = font.pointSize
        
        //choose some text
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing \\ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \\ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \\ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \\ lobortis"
        
        textLayer.string = text
    }
}
























