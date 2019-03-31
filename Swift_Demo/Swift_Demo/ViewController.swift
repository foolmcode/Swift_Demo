//
//  ViewController.swift
//  Swift_Demo
//
//  Created by foolmcode on 2019/3/30.
//  Copyright © 2019 foolmcode. All rights reserved.
//

import UIKit

//参考链接 https://www.jianshu.com/p/c60bc28a1add
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let attributedText = NSMutableAttributedString(string: "Hello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,worldHello,world")
        
        // CoreText支持的属性
        
        // 字体颜色
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSMakeRange(0, 10))
        
        // 下划线
        let underlineStyles = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                               NSAttributedString.Key.underlineColor: UIColor.orange] as [NSAttributedString.Key : Any]
        attributedText.addAttributes(underlineStyles, range: NSMakeRange(10, 10))
        
        // 字体
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 50), range: NSMakeRange(20, 10))
        
        // 描边(Stroke):组成字符的线或曲线。可以加粗或改变字符形状
        let strokeStyles = [NSAttributedString.Key.strokeWidth: 10,
                            NSAttributedString.Key.strokeColor: UIColor.blue] as [NSAttributedString.Key : Any]
        attributedText.addAttributes(strokeStyles, range: NSMakeRange(40, 20))
        
        // 横竖文本
        attributedText.addAttribute(NSAttributedString.Key.verticalGlyphForm, value: 0, range: NSMakeRange(70, 10))
        
        // 字符间隔
        attributedText.addAttribute(NSAttributedString.Key.kern, value: 5, range: NSMakeRange(90, 10))
        
        // 段落样式
        let paragraphStyle = NSMutableParagraphStyle()
        
        //对齐模式
        paragraphStyle.alignment = .center
        
        //换行裁剪模式
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        // 行间距
        paragraphStyle.lineSpacing = 5.0
        
        // 字符间距
        paragraphStyle.paragraphSpacing = 2.0
        
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        
        
        let view = LLLabel.init(frame: CGRect(origin: CGPoint(x: 0, y: 50), size: self.view.frame.size))
        view.backgroundColor = UIColor.white
        view.attributedText = attributedText
        self.view.addSubview(view)
    }


}

