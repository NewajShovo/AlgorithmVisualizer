//
//  ViewController.swift
//  AlgorithmVisualizer
//
//  Created by leo on 24/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: UIView!
    @IBOutlet weak var operationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetViewsToshowSorting();
    }
    
    func resetViewsToshowSorting(){
        let viewWidth = CGFloat(20.0);
        let tempValue = self.canvasView.frame.size.width/viewWidth;
        let remainingLength = self.canvasView.frame.size.width.truncatingRemainder(dividingBy: viewWidth);
        let totalViews = Int(tempValue);
        var initialXValue = CGFloat(remainingLength/2.0);
        var initialYValue = CGFloat(0);
        for _ in 0..<totalViews{
            let height = Float(self.canvasView.frame.size.height);
            let viewHeight = CGFloat(Float.random(in: 50..<height-50));
            initialYValue = self.canvasView.frame.size.height-viewHeight;
            let sortingVisualizerView = UIView();
            sortingVisualizerView.frame = CGRect(x: initialXValue+1, y: initialYValue, width: viewWidth-1, height: viewHeight);
            sortingVisualizerView.backgroundColor = UIColor.green;
            self.canvasView.addSubview(sortingVisualizerView);
            initialXValue += viewWidth;
        }
    }
    
    @IBAction func resetSortingView(_ sender: Any) {
        removeAllViewFromCanvasView();
        resetViewsToshowSorting();
    }
    
    func removeAllViewFromCanvasView(){
        for subview in self.canvasView.subviews{
            subview.removeFromSuperview();
        }
    }

}

