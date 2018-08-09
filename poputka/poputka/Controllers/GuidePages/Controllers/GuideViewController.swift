//
//  GuideViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/17/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var guidePageControl: UIPageControl!
    @IBOutlet weak var guideCollectionView: UICollectionView!
    @IBOutlet weak var goNextButton: BlueButton!
    
    private let buttonTitles = ["Далее" , "Начать"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGuidePageControl()
        setupGuideCollectionView()
        setupGoNextButton(title: buttonTitles[0])
    }
    
    @IBAction func goNextButtonClicked(_ sender: BlueButton) {
        let nextIndex = min(guidePageControl.currentPage + 1, GuidePages.guides.count - 1)
        if nextIndex == GuidePages.guides.count - 1 {
            setupGoNextButton(title: buttonTitles[1])
        }
        
        if goNextButton.titleLabel?.text == buttonTitles[1] {
            DataManager.shared.setUserGuide()
            let vc = viewControllerWith(identifier: "LoginViewController", storyboard: "Login")
            present(vc, animated: true, completion: nil)
        } else {
            let index = IndexPath(item: nextIndex, section: 0)
            guidePageControl.currentPage = nextIndex
            guideCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
    private func setupGuidePageControl() {
        guidePageControl.pageIndicatorTintColor = .lightGray
        guidePageControl.numberOfPages = GuidePages.guides.count
        guidePageControl.currentPageIndicatorTintColor = Colors.blue
    }
    
    private func setupGuideCollectionView() {
        guideCollectionView.isPagingEnabled = true
        guideCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupGoNextButton(title: String) {
        goNextButton.setTitle(title, for: .normal)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GuidePages.guides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! GuidePagesCell
        cell.fillGuides(guide: GuidePages.guides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize(width: width, height: height)
        
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        if index == 2 {
            setupGoNextButton(title: buttonTitles[1])
        } else {
            setupGoNextButton(title: buttonTitles[0])
        }
        guidePageControl.currentPage = index
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
