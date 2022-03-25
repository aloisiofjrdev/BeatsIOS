//
//  ProductListController.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import UIKit


class ProductListController: UIViewController {
    
    
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var doubtButton: UIButton!
    
//    private var fonesListVM: FonesViewModelList?
    private lazy var fonesViewModel = FonesViewModel(delegate: self)
    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setup()
        configureNavigation()
        fonesViewModel.loadFones()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if object is UITableView {
                if let newvalue = change?[.newKey]{
                    let newsize = newvalue as! CGSize
                    self.tableHeight.constant = newsize.width
                }
            }
        }
    }
    
    //MARK: - Methods
    
    private func configureUI() {
        
        logOutButton.layer.cornerRadius = 20
        logOutButton.tintColor = .white
        logOutButton.setTitle("Logout", for: .normal)
        logOutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        logOutButton.setTitleColor(.white, for: .normal)
        
    }
    
    private func configureNavigation() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.backButtonTitle = ""
        
    }
    
    private func setup() {
       
        }
        
//        let url = URL(string: "https://74d92505-ba80-4848-b243-f79c813a14c8.mock.pstmn.io")!
//
//        WebService().getFones(url: url) { fones in
//
//            if let fones = fones {
//                self.fonesListVM = FonesViewModelList(fones: fones)
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//        }
    
    private func setLogOutUserDefaults() {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
    }
    
    // MARK: - Actions
    
    @IBAction func logOutButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        setLogOutUserDefaults()
        
    }
    
}

    // MARK: - Delegates/DataSource

extension ProductListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonesViewModel.fones.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BeatsCell", for: indexPath) as? BeatsCellTableViewCell {
            
            cell.fone = fonesViewModel.fones[indexPath.row]
            
//            let foneVM = self.fonesListVM?.foneAtIndex(indexPath.row)
//
//            cell.nameFoneLabel.text = foneVM?.beatsModel
//            cell.priceLabel.text = foneVM?.price
//            cell.rateLabel.text = foneVM?.rate
//            cell.reviewsLabel.text = foneVM?.reviews
            
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detalhesFones = self.fonesViewModel.fones[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailsBeatsViewController") as! DetailsBeatsViewController
        controller.setupContent()
        controller.foneVM?.fone = detalhesFones
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}

extension ProductListController: FonesViewModelDelegate {
    func onLoadFones() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onError(error: Error) {
        DispatchQueue.main.async {
            self.displayMyAlertMessage(title: "Ops, ocorreu um erro", message: error.localizedDescription, buttonTitle: "Ok")
        }
    }
    
    
}
