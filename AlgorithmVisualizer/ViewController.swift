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
        let viewWidth = CGFloat(50.0);
        let tempValue = self.canvasView.frame.size.width/viewWidth;
        let remainingLength = self.canvasView.frame.size.width.truncatingRemainder(dividingBy: viewWidth);
        let totalViews = Int(tempValue);
        var initialXValue = CGFloat(remainingLength/2.0);
        var initialYValue = CGFloat(0);
        for viewTag in 0..<totalViews{
            let height = Float(self.canvasView.frame.size.height);
            let viewHeight = CGFloat(Float.random(in: 50..<height-50));
            initialYValue = self.canvasView.frame.size.height-viewHeight;
            let sortingVisualizerView = UIView();
            sortingVisualizerView.frame = CGRect(x: initialXValue+1, y: initialYValue, width: viewWidth-1, height: viewHeight);
            sortingVisualizerView.backgroundColor = UIColor.green;
            sortingVisualizerView.tag = viewTag+100;
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
    
    
    
    @IBAction func sortUsingBubbleSortAlgorithm(_ sender: Any) {
        applyBubbleSortingInCanvasView();
    }
    
    
    func applyBubbleSortingInCanvasView(){
        let totalViews = Int(self.canvasView.subviews.count);
        for _ in 0..<totalViews{
            for j in 1..<totalViews{
                let viewTag = j+100;
                let tempView1 = self.canvasView.viewWithTag(viewTag);
                let currentViewHeight = Int(tempView1?.frame.size.height ?? 0);
                let currentOrigin = tempView1?.frame.origin;
                let tempView2 = self.canvasView.viewWithTag(viewTag-1);
                let previousViewHeight = Int(tempView2?.frame.size.height ?? 0);
                let previousOrigin = tempView2?.frame.origin;
                if(previousViewHeight>currentViewHeight){
                    let replaceView1 = UIView();
                    replaceView1.frame = CGRect(x: previousOrigin!.x, y: currentOrigin!.y, width: (tempView1?.frame.size.width)!, height: CGFloat(currentViewHeight));
                    self.canvasView.addSubview(replaceView1);
                    tempView1?.removeFromSuperview();
                    let replaceView2 = UIView();
                    replaceView2.frame = CGRect(x: currentOrigin!.x, y: previousOrigin!.y, width: (tempView1?.frame.size.width)!, height: CGFloat(previousViewHeight));
                    self.canvasView.addSubview(replaceView2);
                    tempView2!.removeFromSuperview();
                    replaceView1.tag = viewTag-1;
                    replaceView2.tag = viewTag;
                    replaceView1.backgroundColor = UIColor.green;
                    replaceView2.backgroundColor = UIColor.green;

                }
                
            }
        }
    }
    
    

}

