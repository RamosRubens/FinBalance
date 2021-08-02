//
//  SearchTableViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 26/07/21.
//

import UIKit
import Combine
import MBProgressHUD

class SearchTableViewController: UITableViewController, UIAnimatable {
    
    private let apiService = APIService()
    private var subscribers = Set<AnyCancellable>()
    private var searchResults: SearchResults?
    
    @Published private var mode: Mode = .firstTime
    @Published private var searchQuery = String()

    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Entre com o nome da empresa ou o ticket"
        sc.searchBar.autocapitalizationType = .allCharacters
        print(sc)
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        observeForm()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = K.Titles.searchTitle
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    private func observeForm() {
        
        $searchQuery
            .debounce(for: .milliseconds(750), scheduler: RunLoop.main)
            .sink { [unowned self] (searchQuery) in
                guard !searchQuery.isEmpty else { return }
                showLoadingAnimation()
                self.apiService.fetchSymbolsPublisher(keywords: searchQuery).sink { (completion) in
                    hideLoadingAnimation()
                    switch completion {
                    case .failure(let error):
                            print(error.localizedDescription)
                    case .finished: break
                    }
                } receiveValue: { (searchResults) in
                    self.searchResults = searchResults
                    self.tableView.reloadData()
                }.store(in: &subscribers)
            }
            .store(in: &subscribers)
        
        $mode.sink { [unowned self] (mode) in
            switch mode {
            case .firstTime:
                self.tableView.backgroundView = SearchPlaceHolderView()
            case .search:
                self.tableView.backgroundView = nil
            }
        }.store(in: &subscribers)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Id.companyCellId, for: indexPath) as! SearchTableViewCell
        if let searchResults = self.searchResults {
            let searchResult = searchResults.items[indexPath.row]
            cell.configure(with: searchResult)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let searchResults = self.searchResults {
            let searchResult = searchResults.items[indexPath.item]
            let symbol = searchResult.symbol
            handleSelection(for: symbol, searchResult: searchResult)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func handleSelection(for symbol: String, searchResult: SearchResult) {
        showLoadingAnimation()
        apiService.fetchTimeSeriesMonthlyAdjustedPublisher(keywords: symbol).sink { (completionResult) in
            self.hideLoadingAnimation()
            switch completionResult {
            case .failure(let error):
                print(error)
            case .finished: break
            }
        } receiveValue: { (timeSeriesMonthlyAdjusted) in
            self.hideLoadingAnimation()
            let asset = Asset(searchResult: searchResult, timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted)
            self.performSegue(withIdentifier: K.Segue.showCalculator, sender: asset)
            self.searchController.searchBar.text = nil
        }.store(in: &subscribers)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.showCalculator,
           let destination = segue.destination as? CalculatorTableViewController,
           let asset = sender as? Asset {
            destination.asset = asset
        }
    }
}

extension SearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchQuery = searchController.searchBar.text, !searchQuery.isEmpty else { return }
        self.searchQuery = searchQuery
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        mode = .search
    }
}
