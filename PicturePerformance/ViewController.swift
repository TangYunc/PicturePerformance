//
//  ViewController.swift
//  PicturePerformance
//
//  Created by 中发 on 2018/6/8.
//  Copyright © 2018年 中发. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    ///如何设置圆角，不要用圆角半径
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rect = CGRect(x: 0, y: 0, width: 170, height: 170)
        
        let iv = UIImageView(frame: rect)
        iv.center = view.center
        view.addSubview(iv)
        //设置图像，
        //PNG图片是支持透明的
        //jpg图片不支持透明，使用imageNamed方法，需要指定扩展名
//        let imageIcon = #imageLiteral(resourceName: "avatar_default_big")
        let imageIcon = UIImage(named: "头像.jpg")
        
//        iv.image = imageIcon
        iv.image = avatarImage(image: imageIcon!, size: rect.size, backGroundColor: view.backgroundColor)
    }

    /// 将给定的图像进行拉伸，并且返回‘新的’图像
    ///
    /// - Parameters:
    ///   - image: 将要绘制的图片
    ///   - size: 绘图的尺寸
    /// - Returns: UIImage
    func avatarImage(image: UIImage, size: CGSize, backGroundColor: UIColor?) -> UIImage? {
        let rect = CGRect(origin: CGPoint(), size: size)
       //1.图像的上下文，内存中开辟地址，与屏幕无关
        /**
         参数：
         size，绘图的尺寸
         peaque:不透明 false / true
         scale：屏幕分辨率，默认生成的图像默认使用1.0的分辨率，图像质量不好。所以可以指定 0，即会选择当前屏幕的分辨率
         */UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        //0.背景填充
        backGroundColor?.setFill()
        UIRectFill(rect)
        //1.实例化一个圆形的的路径
        let path = UIBezierPath(ovalIn: rect)
        //2.进行路径裁切， -- 后续的绘图都会出现在路径内部，外面的全部干掉
        path.addClip()
       
        //绘制drawInRect就是在指定区域内拉伸屏幕
        image.draw(in: rect)
        //绘制内切的圆形
        //设置边线
        UIColor.darkGray.setStroke()
        path.lineWidth = 2
        path.stroke()
        //取得结果
        let result =  UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        //返回结果
        return result
    }

}

