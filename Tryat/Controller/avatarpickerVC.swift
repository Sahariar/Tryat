//
//  avatarpickerVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/7/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class avatarpickerVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//outlets
	@IBOutlet weak var segmentControl: UISegmentedControl!
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		collectionView.delegate = self
		collectionView.dataSource = self
    }
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
			return cell
		}
		return AvatarCell()
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 28
	}
	
	@IBAction func backPressedBtn(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}

	@IBAction func segmentCChanged(_ sender: Any) {
	}
	
	
	
	
	
	
	
	
	
	
}
