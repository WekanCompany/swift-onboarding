//
//  ViewController.swift
//  Swift_OnBoarding
//
//  Created by Santhosh Kumar on 25/03/20.
//  Copyright © 2020 WeKanCode. All rights reserved.
//

import UIKit

let appDelegate  =   UIApplication.shared.delegate as! AppDelegate

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var onboardCollectionView: UICollectionView!
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Button actions
    
    @IBAction func skipAction(_ sender: Any) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            UserDefaults.standard.set(false, forKey: "SHOW_ONBOARD_TUTORIAL")
            appDelegate.setRootViewController()
        }) { finished in
        }
    }
    
    @IBAction func nextAction(_ sender: Any) {
        var currentPage = pageCtrl.currentPage
        if currentPage < 2 {
            currentPage = currentPage + 1
            onboardCollectionView.scrollToItem(at: IndexPath(item: currentPage , section: 0), at: [], animated: true)
            pageCtrl.currentPage = currentPage
            btnNext.setTitle(Int(pageCtrl.currentPage) == 2 ? "Get Started" : "Next", for: .normal)
            btnSkip.isHidden = (pageCtrl.currentPage == 2)
        } else {
            UserDefaults.standard.set(false, forKey: "SHOW_ONBOARD_TUTORIAL")
            appDelegate.setRootViewController()
        }
    }
}

// MARK: - UICollectionView delegate & datasource

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = indexPath.row == 0 ? "Onboard0" : indexPath.row == 1 ? "Onboard1" : "Onboard2"
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - ScrollView delegate

extension OnBoardingViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = onboardCollectionView.frame.size.width
        let currentPage = Float(onboardCollectionView.contentOffset.x / pageWidth)
        pageCtrl.currentPage = 0.0 != fmodf(currentPage, 1.0) ? Int(currentPage + 1) : Int(currentPage)
        btnNext.setTitle(Int(pageCtrl.currentPage) == 2 ? "Get Started" : "Next", for: .normal)
        btnSkip.isHidden = (pageCtrl.currentPage == 2)
    }
}
