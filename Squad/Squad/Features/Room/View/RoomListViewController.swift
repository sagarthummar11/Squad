//
//  ViewController.swift
//  Squad
//
//  Created by Sagar Thummar on 08/04/2022.
//

import UIKit
import SquadStyle
import SquadComponent

class RoomListViewController: SquadBaseViewController {

    //MARK:- Properties -
    @IBOutlet weak var roomListCollectionView: UICollectionView! {
        didSet {
            roomListCollectionView.dataSource = self
            roomListCollectionView.delegate = self
        }
    }
    
    var viewModel: RoomViewModel!
    
    fileprivate let roomTabItem = {
        UITabBarItem(title: "tab.rooms.title".localized,
                     image: AppImage.roomList.image,
                     selectedImage: AppImage.roomListSelected.image)
    }()
    
    //MARK:- View Controller Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        //Configure Navigation Bar
        title = "room.List.navigation.title".localized
    }

    //MARK: - View Configuration Methods -
    private func configureView() {
        viewModel.fetchRooms()
    }
    
    private func bindViewModel() {
        
        viewModel.roomList.bind { [weak self] roomList in
            DispatchQueue.main.async { [weak self] in
                self?.roomListCollectionView.reloadData()
            }
        }
        
        viewModel.handleError.bind { [weak self] error in
            
        }
    }
}

//MARK: - RoomListViewController TabDetailsProtocol Cofirmation -
extension RoomListViewController: TabDetailsProtocol {
    
    var tabItem: UITabBarItem {
        roomTabItem
    }
}
 
//MARK: - UICollectionView Data Source & Delegate Methods -
extension RoomListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let roomCell: RoomCollectionViewCell = roomListCollectionView.dequeue(cellForItemAt: indexPath)
        roomCell.configureView()
        return roomCell
    }
}

//MARK:-
extension RoomListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (collectionView.frame.width - 30)/2
        let cellWidth = cellSize.clamped(cellSize, 200)
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
