import UIKit

class CircleSpawnController: UIViewController {

	// TODO: Assignment 1

	override func loadView() {
		view = UIView()
		view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
	}
    
    @objc func handleTap(_ tap: UITapGestureRecognizer) {
           
        //Tworzenie koła
        let size: CGFloat = 100
        let circleView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        circleView.center = tap.location(in: self.view)
        circleView.backgroundColor = UIColor.randomBrightColor()
        circleView.layer.cornerRadius = size * 0.5
        circleView.alpha = 0;
        view.addSubview(circleView)
        
        //Animacja dodania koła
        circleView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        let animator = UIViewPropertyAnimator(duration: 0.5 , curve: .easeOut, animations: {
            circleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            circleView.alpha = 1;
        })
        animator.startAnimation()
    }
}


