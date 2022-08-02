import UIKit

class SecondViewController : UIViewController {
    
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!

    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()
    
    var subviews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add the scroll view to self.view
        self.view.addSubview(scrollView)
        
        let safeG = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            // constrain the scroll view to safe area with 8-pts on each side
            scrollView.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 100),
            scrollView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 8.0),
            scrollView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: -8.0),
            scrollView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor, constant: -8.0),
        ])
    }
    

    @IBAction func addSubView(_ sender: UIButton){
        let count = subviews.count
        let output = MyView(frame: CGRect(x: 40, y: 50*(count-1), width: 100, height: 100))
        output.currentNumber?.text = "\(count)"
        output.currentTime?.text = getTime()
        output.tag = count
        scrollView.addSubview(output)
        scrollView.resizeScrollViewContentSize()
        subviews.append(output)
    }
    
    @IBAction func removeSubView(_ sender: UIButton){

        let count = subviews.count
        if let subview = self.view.viewWithTag(count) {
            if subviews.count != 0{
                subview.removeFromSuperview()
                subviews.removeLast()
            }
        }
    }

    // get current time
    func getTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let result = "\(hour):\(minutes):\(second)"
        return result
    }
}
// extension to resize
extension UIScrollView {
    func resizeScrollViewContentSize() {
        var contentRect = CGRect.zero
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.contentSize = contentRect.size
    }
}

