//
//  ViewController.swift
//  glycemic
//
//  Created by EMP on 10/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
   
    @IBOutlet weak var mytableView: UITableView!
    
    var apiData: ApiModel?
    var filteredData: Optional<[[String]]> = []
    
    var search:Bool = false
    
    var emptyDataView: EmptyDataView {
        let view = EmptyDataView()
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerTableView()
        self.getNEWData()
        self.setupSearchBar()
    }
    
    private func getNEWData() {
        
        ApiHelper.sharedInstance.foodInfo { [weak self] data in
            guard let self else { return }
            self.apiData = data
            DispatchQueue.main.async {
                self.mytableView.reloadData()
            }
        }
    }
    
    private func registerTableView() {
        mytableView.dataSource = self
        mytableView.delegate = self
        
        mytableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search"
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if search {
            return filteredData?.count ?? 0
        }
        else {
            return apiData?.data.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.myView.layer.cornerRadius = 20
        if search == false {
            if let ingerd = apiData?.data[indexPath.row].first {
                cell.ingredients.text = ingerd
                cell.ingredients.numberOfLines = 0
                cell.ingredients.lineBreakMode = .byWordWrapping
                cell.ingredients.adjustsFontSizeToFitWidth = true
                cell.ingredients.minimumScaleFactor = 0.5
            }
            if let foodData = apiData?.data, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let foodnameIndexValue = innerArray[2]
                if foodnameIndexValue == "" {
                    cell.foodName.text = "No Name Available"
                } else {
                    cell.foodName.text = foodnameIndexValue
                }
                
            }
            
            if let foodData = apiData?.data, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let glIndexValue = innerArray.filter{ (Int($0)) != nil}.first
                cell.GlNumber.text = glIndexValue
            }
        } else {
            if filteredData?.count ?? 0 >= 0{
                mytableView.backgroundView = emptyDataView
            } else {
                mytableView.backgroundView = nil
                if let ingerd = filteredData?[indexPath.row].first {
                    cell.ingredients.text = ingerd
                }
                if let foodData = filteredData , indexPath.row < foodData.count {
                    let innerArray = foodData[indexPath.row]
                    let foodnameIndexValue = innerArray[2]
                    if foodnameIndexValue == "" {
                        cell.foodName.text = "No Name Available"
                    } else {
                        cell.foodName.text = foodnameIndexValue
                    }
                    
                }
                
                if let foodData = filteredData, indexPath.row < foodData.count {
                    let innerArray = foodData[indexPath.row]
                    let glIndexValue = innerArray.filter{ (Int($0)) != nil}.first
                    cell.GlNumber.text = glIndexValue
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailsCell") as? DetailsViewController else {
            return
        }
        
        vc.modalPresentationStyle = .pageSheet
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        if search == false {
            
            if let foodName = apiData?.data[indexPath.row].first {
                vc.heading = foodName
                
            }
            
            if let foodData = apiData?.data, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let productIndexValue = innerArray[1]
                vc.product = productIndexValue
            }
            
            if let foodData = apiData?.data, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let GLIndexValue = innerArray.filter{ (Int($0)) != nil }.first
                vc.Glno = GLIndexValue
            }
            
            if let foodData = apiData?.data, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let GIIndexValue = innerArray[5]
                vc.GIno = GIIndexValue
            }
            
            if let foodData = apiData?.data, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let cardIndexValue = innerArray[6]
                vc.cardsno = cardIndexValue
            }
            
            if let foodData = apiData?.data, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let proteinIndexValue = innerArray[7]
                vc.proteinsno = proteinIndexValue
            }
        } else {
            if let foodName = filteredData?[indexPath.row].first {
                vc.heading = foodName
                
            }
            
            if let foodData = filteredData, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let productIndexValue = innerArray[1]
                vc.product = productIndexValue
            }
            
            if let foodData = filteredData, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let GLIndexValue = innerArray.filter{ (Int($0)) != nil }.first
                vc.Glno = GLIndexValue
            }
            
            if let foodData = filteredData, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let GIIndexValue = innerArray[5]
                vc.GIno = GIIndexValue
            }
            
            if let foodData = filteredData, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let cardIndexValue = innerArray[6]
                vc.cardsno = cardIndexValue
            }
            
            if let foodData = filteredData, indexPath.row < foodData.count {
                let innerArray = foodData[indexPath.row]
                let proteinIndexValue = innerArray[7]
                vc.proteinsno = proteinIndexValue
            }
        }
        
        present(vc,animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let apiData = apiData else { return }
        search = true
        if searchText.isEmpty {
            search = false
            filteredData = apiData.data
        } else {
            filteredData = apiData.data.filter { innerArray in
                return String(innerArray[0]).lowercased().contains(searchText.lowercased()) || String(innerArray[1]).lowercased().contains(searchText.lowercased()) || String(innerArray[2]).lowercased().contains(searchText.lowercased())
            }
        }
        
        // Reload the table view with the filtered data
        self.mytableView.reloadData()
    }
}
