//
//  CircularProgressBarView.swift
//  CircularProgressBar
//
//  Created by kevin fichou on 15/09/2023.
//

import UIKit

class CircularProgressBarView: UIView {
    
// MARK: - Properties
    
    private var _circleLayer: CAShapeLayer = CAShapeLayer()
    private var _progressLayer: CAShapeLayer = CAShapeLayer()
    private var _circularPath: UIBezierPath!
    private var _startPoint: CGFloat = (-Double.pi/2)
    private var _endPoint: CGFloat = 3*Double.pi/2
    
// MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCircularPath()
        self.setCircleLayer()
        self.setProgressLayer()
        self.layer.addSublayer(self._circleLayer)
        self.layer.addSublayer(self._progressLayer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
// MARK: - Private Methods
    
    private func createCircularPath() {
        self._circularPath = UIBezierPath(
            arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
            radius: 80,
            startAngle: self._startPoint,
            endAngle: self._endPoint,
            clockwise: true)
    }
    
    private func setCircleLayer() {
        self._circleLayer.path = self._circularPath.cgPath
        self._circleLayer.fillColor = UIColor.clear.cgColor
        self._circleLayer.lineCap = .round
        self._circleLayer.lineWidth = 20
        self._circleLayer.strokeEnd = 1
        self._circleLayer.strokeColor = UIColor.white.cgColor
    }
    
    private func setProgressLayer() {
        self._progressLayer.path = self._circularPath.cgPath
        self._progressLayer.fillColor = UIColor.clear.cgColor
        self._progressLayer.lineCap = .round
        self._progressLayer.lineWidth = 10
        self._progressLayer.strokeEnd = 0
        self._progressLayer.strokeColor = UIColor.green.cgColor
    }
    
    public func progressAnimation(duration: TimeInterval) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        self._progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
