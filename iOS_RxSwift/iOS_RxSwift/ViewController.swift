//
//  ViewController.swift
//  iOS_RxSwift
//
//  Created by Eslam Ali  on 20/03/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ViewModel = productViewModel()
    
    var bag = DisposeBag()
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTabelData()
    }
    
    
    func bindTabelData()  {
        // bind items to the table = cellForRowAtIndexPath (datasource)
        
        ViewModel.items.bind(to: tableView.rx.items(cellIdentifier: "cell")) { row , model , cell in
            cell.textLabel?.text = model.productName
            cell.imageView?.image = UIImage(systemName: model.productImage)
            
        }.disposed(by: bag)
        
        
        // bind selected model selected handler
        // did select item form the table view = didSelectRowAtIndexPath() (Delegate)
      //  tableView.rx.modelSelected(Product.self)
        
        //fetch items
        ViewModel.fetchItems()
    }


}

