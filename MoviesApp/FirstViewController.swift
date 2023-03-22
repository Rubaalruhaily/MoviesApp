//
//  ViewController.swift
//  MoviesApp
//
//  Created by Ruba on 21/08/1444 AH.
//

import UIKit

class FirstViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout ,UIScrollViewDelegate {
   
    @IBOutlet weak var PageControlTopMovies: UIPageControl!
    @IBOutlet weak var ScrollViewTopMovies: UIScrollView!
    @IBOutlet weak var DramaCollect: UICollectionView!
    @IBOutlet weak var ComedyCollect: UICollectionView!
    
    var imagesMoVIES: [String] = ["Movieposter 1", "Movieposter 2" , "Movieposter 3"]
    var frame = CGRect(x:0, y: 0, width:0, height:0)
    var arrDrama = [dramamovies]()
    var arrComedy = [comedymovies]()
    var movirs = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PageControlTopMovies.numberOfPages = imagesMoVIES.count
        for index in 0..<imagesMoVIES.count {
            frame.origin.x = ScrollViewTopMovies.frame.size.width
            * CGFloat(index)
            frame.size = ScrollViewTopMovies.frame.size
            let imgTop = UIImageView(frame: frame)
            imgTop.image = UIImage(named:imagesMoVIES[index])
            self.ScrollViewTopMovies.addSubview(imgTop)
        }
        ScrollViewTopMovies.contentSize = CGSize(width: ScrollViewTopMovies.frame.size.width * CGFloat(imagesMoVIES.count) ,height: ScrollViewTopMovies.frame.size.height)
        
        ScrollViewTopMovies.delegate = self
        DramaCollect.delegate = self
        ComedyCollect.delegate = self
        
        
        DramaCollect.dataSource = self
        ComedyCollect.dataSource = self
        
        //        self.view.addSubview(DramaCollect)
        //        self.view.addSubview(ComedyCollect)
        
        arrDrama.append(dramamovies(dramaphoto: UIImage(named: "Movieposter 1")!))
        arrDrama.append(dramamovies(dramaphoto: UIImage(named: "Movieposter 2")!))
        arrDrama.append(dramamovies(dramaphoto: UIImage(named: "Movieposter 3")!))
        arrDrama.append(dramamovies(dramaphoto: UIImage(named: "Movieposter 1")!))
        arrDrama.append(dramamovies(dramaphoto: UIImage(named: "Movieposter 2")!))
        arrDrama.append(dramamovies(dramaphoto: UIImage(named: "Movieposter 3")!))

        
        arrComedy.append(comedymovies(comedymovies: UIImage(named: "Movieposter 1")!))
        arrComedy.append(comedymovies(comedymovies: UIImage(named: "Movieposter 2")!))
        arrComedy.append(comedymovies(comedymovies: UIImage(named: "Movieposter 1")!))
        arrComedy.append(comedymovies(comedymovies: UIImage(named: "Movieposter 5")!))
       

    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = ScrollViewTopMovies.contentOffset.x / ScrollViewTopMovies.frame.size.width
        PageControlTopMovies.currentPage = Int(pageNumber)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.DramaCollect {
            return arrDrama.count
        }
        return arrComedy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == DramaCollect ){
            
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "DramaMovies", for: indexPath) as! DramaCell
            let drama = arrDrama[indexPath.row]
            cellA.steupCell1(dramaphoto: drama.dramaphoto)
//            cellA.backgroundColor = .red
            
            
            return cellA
        }
        else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "Comedy", for: indexPath) as! Comedycell
            
            let Comedy = arrComedy[indexPath.row]
            cellB.steupCell2(comedymovies: Comedy.comedymovies)
            
            return cellB
        }}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 200)
    }
        
    }
    
    
    
 
    
    
struct dramamovies {
    let dramaphoto: UIImage
    
    
        
        
    }
    struct comedymovies {
        let comedymovies: UIImage
    }

