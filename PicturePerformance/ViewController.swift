//
//  ViewController.swift
//  PicturePerformance
//
//  Created by 中发 on 2018/6/8.
//  Copyright © 2018年 中发. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rect = CGRect(x: 0, y: 0, width: 170, height: 170)
        
        let iv = UIImageView(frame: rect)
        iv.center = view.center
        view.addSubview(iv)
        //设置图像，PNG图片是支持透明的
        let imageIcon = #imageLiteral(resourceName: "avatar_default_big")
        
        iv.image = avatarImage(image: imageIcon, size: rect.size)
    }

    /// 将给定的图像进行拉伸，并且返回‘新的’图像
    ///
    /// - Parameters:
    ///   - image: 将要绘制的图片
    ///   - size: 绘图的尺寸
    /// - Returns: UIImage
    func avatarImage(image: UIImage, size: CGSize) -> UIImage? {
        let rect = CGRect(origin: CGPoint(), size: size)
       //1.图像的上下文，内存中开辟地址，与屏幕无关
        /**
         参数：
         size，绘图的尺寸
         peaque:不透明 false / true
         scale：屏幕分辨率，默认生成的图像默认使用1.0的分辨率，图像质量不好。所以可以指定 0，即会选择当前屏幕的分辨率
         */UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        //绘制drawInRect就是在指定区域内拉伸屏幕
        image.draw(in: rect)
        //取得结果
        let result =  UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        //返回结果
        return result
    }

}

