//
//  ViewController.swift
//  LJCoordinate
//
//  Created by 唐星宇 on 2020/12/1.
//

import UIKit

class ViewController: UIViewController {
    
    var btn: UIButton = UIButton()
    
    var coordinateV: LJCoordinateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let frame: CGRect = CGRect(x: 20, y: 200, width: SCREEN_WIDTH - WidthScale(40), height: WidthScale(200))
        coordinateV = LJCoordinateView(frame: frame, isAnimated: true, isSmooth: true)
        
        var arr: [LJCoordinatePointModel] = []
        for i in 0 ..< 15{
            let model = LJCoordinatePointModel(withXVal: "\(i)")
            model.yVal = CGFloat(arc4random() % 50)
            arr.append(model)
            print(model.yVal)
        }
        coordinateV.pointsArr = arr
        
        view.addSubview(coordinateV)
        
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        btn.setTitle("曲线图", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: WidthScale(16))
        btn.setTitleColor(.black, for: .normal)
        btn.frame = CGRect(x: WidthScale(160), y:WidthScale(420), width: 0, height: 0)
        btn.sizeToFit()
    }
    
    @objc func btnAction(){
        if btn.titleLabel?.text == "折线图"{
            btn.setTitle("曲线图", for: .normal)
            coordinateV.isSmooth = true
        }else{
            btn.setTitle("折线图", for: .normal)
            coordinateV.isSmooth = false
        }
        coordinateV.reDrawPoints()
    }


}

