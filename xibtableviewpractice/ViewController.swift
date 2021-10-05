//
//  ViewController.swift
//  xibtableviewpractice
//
//  Created by Hurraira Bhatti on 10/4/21.
//

import UIKit


class ViewController: UIViewController {
    let productCellId = "ProductTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    var products = [ProductDto]()
    let productData : KeyValuePairs = [ "red": "#FF0000", "green": "#00FF00", "blue": "#0000FF", "cyan": "#00FFFF", "magenta": "#FF00FF", "yellow": "#FFFF00", "black": "#000000" ]
    
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    // Register cell
    tableView.register(UINib.init(nibName: productCellId, bundle: nil), forCellReuseIdentifier: productCellId)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorColor = UIColor.clear
    
    // Init Data
for value in productData {
    let product = ProductDto()
    product?.name = value.key
        
    product?.desc = value.value
    products.append(product!)}
    tableView.reloadData()
    
}


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath) as! ProductTableViewCell
        cell.selectionStyle = .none
        let product = products[indexPath.row]
        cell.lblName.text = product.name!
        cell.lblDesc.text = product.desc!
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("\(indexPath.row) - \(product.name!)")
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.colorCode = product.desc!
        self.navigationController?.pushViewController(secondViewController, animated: true)
   
   
 }

}
    






