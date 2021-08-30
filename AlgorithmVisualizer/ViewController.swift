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
        var timer1 = Timer();
        var outerLoop = 0, innerLoop=1;
        timer1 = Timer.scheduledTimer(withTimeInterval:1.0, repeats: true){ _ in
            let viewTag = innerLoop+100;
            let currentView = self.canvasView.viewWithTag(viewTag);
            currentView?.backgroundColor = UIColor.blue;
            let previousView = self.canvasView.viewWithTag(viewTag-1);
            previousView?.backgroundColor = UIColor.blue;
            let currentViewHeight = Int(currentView?.frame.size.height ?? 0);
            let currentOrigin = currentView?.frame.origin;
            let previousViewHeight = Int(previousView?.frame.size.height ?? 0);
            let previousOrigin = previousView?.frame.origin;
            _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ t1 in
                if(previousViewHeight>currentViewHeight){
                    let replacePrev = UIView();
                    replacePrev.frame = CGRect(x: previousOrigin!.x, y: currentOrigin!.y, width: (currentView?.frame.size.width)!, height: CGFloat(currentViewHeight));
                    let replaceCurrent = UIView();
                    replaceCurrent.frame = CGRect(x: currentOrigin!.x, y: previousOrigin!.y, width: (currentView?.frame.size.width)!, height: CGFloat(previousViewHeight));
                    self.canvasView.addSubview(replacePrev);
                    self.canvasView.addSubview(replaceCurrent);
                    currentView?.removeFromSuperview();
                    previousView!.removeFromSuperview();
                    replacePrev.tag = viewTag-1;
                    replaceCurrent.tag = viewTag;
                    replacePrev.backgroundColor = UIColor.green;
                    replaceCurrent.backgroundColor = UIColor.green;
                }
                else{
                    currentView?.backgroundColor = UIColor.green;
                    previousView?.backgroundColor = UIColor.green;
                }
                t1.invalidate();
            }
            innerLoop+=1;
            if(outerLoop==totalViews){
                timer1.invalidate();
            }
            else if(innerLoop==totalViews) {
                innerLoop = 1;
                outerLoop+=1;
            }
        }
        
    }
    
}

