//
//  DetailViewController.swift
//  BookstoreREST
//
//  Created by user168039 on 5/1/20.
//  Copyright © 2020 Tec. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    

    func configureView() {

        // Update the user interface for the detail item.
        if let detail = detailItem {
            titleLabel.text = detail.title
            authorLabel.text = detail.author
            descriptionLabel.text = detail.description
        }
        
        func getData(from url: URL,
             completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
                  URLSession.shared.dataTask(with: url,
                 completionHandler: completion).resume()
        }
        
        
        
        let posterUrl = URL(string: movie!.poster)
        getData(from: posterUrl!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.posterImageView.image = UIImage(data: data)
            }
        }

    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        
       
        
    }

    var detailItem: Book? {
        didSet {
            // Update the view.
        }
    }
    
    


}

