//
//  MyViewController.swift
//  Add-Minus
//
//  Created by Dung on 7/28/22.
//

import UIKit

class MyViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIView!
    var subviews: [UIView] = []
    
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.frame = self.view.bounds
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        // Do any additional setup after loading the view.
    }

    func getTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let result = "\(hour):\(minutes):\(second)"
        return result
        
    }

    
    @IBAction func addSubView(_ sender: UIButton) {
        let count = subviews.count
        let output = MyView(frame: CGRect(x: 40, y: (120+50*count), width: 100, height: 100))
        output.currentNumber?.text = "\(count+1)"
        output.currentTime?.text = getTime()
        contentView.addSubview(output)
        
        subviews.append(output)
    }
    
    @IBAction func removeSubView(_ sender: UIButton){
        while subviews.count != 0{
        subviews.last?.removeFromSuperview()
        subviews.removeLast()}

    }
}
