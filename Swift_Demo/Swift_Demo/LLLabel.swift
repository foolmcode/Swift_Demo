//
//  LLCoreTextView.swift
//  Swift_Demo
//
//  Created by foolmcode on 2019/3/30.
//  Copyright © 2019 foolmcode. All rights reserved.
//

import UIKit

 class LLLabel: UIView {

    var attributedText : NSAttributedString?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        
        
        
        context?.textMatrix = CGAffineTransform.identity
        context?.translateBy(x: 0, y: self.bounds.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        
       let path = CGPath.init(rect: self.bounds, transform: nil)
//        let attstring = NSMutableAttributedString(string: "hello,coretext")
        let framesetter = CTFramesetterCreateWithAttributedString(attributedText!)
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attributedText!.length), path, nil)
        CTFrameDraw(frame, context!)
        
    
    }
    
    func drawByLine(frame:CTFrame,context:CGContext){
        let lines = CTFrameGetLines(frame)
        let numberOfLines = CFArrayGetCount(lines)
        var lineOrigins = [CGPoint](repeating: CGPoint.zero, count: numberOfLines)
        CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), &lineOrigins)
        for index in 0 ..< numberOfLines{
            let origin = lineOrigins[index]
            let line = unsafeBitCast(CFArrayGetValueAtIndex(lines, index), to: CTLine.self)
            context.textPosition = CGPoint(x: origin.x, y: origin.y)
            CTLineDraw(line, context)
        }
    }

    func drawLine(line:CTLine , context:CGContext){
        let runs = CTLineGetGlyphRuns(line) as Array
        runs.forEach { run in
            CTRunDraw(run as! CTRun, context, CFRangeMake(0, 0))
        }
    }

}
