import UIKit

class CircleSpawnController: UIViewController {

    // TODO: Assignment 1

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
    
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(sender:)))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(handleTripleTap(sender:)))
        tripleTap.numberOfTapsRequired = 3
        view.addGestureRecognizer(tripleTap)
        
        doubleTap.require(toFail: tripleTap)
    }
    
    @objc func handleDoubleTap(sender: UITapGestureRecognizer) {
           
        if sender.state == .ended {
            //Tworzenie koła
            let size: CGFloat = 100
            let circleView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
            circleView.center = sender.location(in: self.view)
            circleView.backgroundColor = UIColor.randomBrightColor()
            circleView.layer.cornerRadius = size * 0.5
            circleView.alpha = 0;
            circleView.tag = 100;
            view.addSubview(circleView)
            
            //Animacja dodania koła
            circleView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            let animator = UIViewPropertyAnimator(duration: 0.1 , curve: .easeInOut, animations: {
                circleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                circleView.alpha = 1;
            })
            animator.startAnimation()
        }
    }
    
    @objc func handleTripleTap(sender: UITapGestureRecognizer) {
        let locationTapped = sender.location(in: self.view)
        if sender.state == .ended {
            let viewsFilter = view.subviews.filter { view -> Bool in return view.frame.contains(locationTapped) }
            guard let viewTapped = viewsFilter.last else { return }
            
            UIView.animate(withDuration: 0.2, animations: {
                viewTapped.alpha = 0
                viewTapped.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: { completed in
                viewTapped.removeFromSuperview()
            })
        }
    }
}


