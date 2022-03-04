//
//  ViewController.swift
//  Dabb
//
//  Created by thamizharasan t on 01/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var BeginBtnOult: UIButton!
    
    @IBOutlet weak var tittleLbl: UILabel!
    
    var getSlide = [Getimg]()
//    var image = ["0","1","2"]
//    var tittle = ["All your digital profile at one place","Chat with your connections any time","Just tab the phone and get other details"]
    override func viewDidLoad() {
        let url = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&formatted=0"
        getData(from: url)
        let firstObj = Getimg.init(img: "0", t: "All your digital profile at one place")
        getSlide.append(firstObj)
        let secondObj = Getimg.init(img: "1", t: "Chat with your connections any time")
        getSlide.append(secondObj)
        let thirdObj = Getimg.init(img: "2", t: "ust tab the phone and get other details")
        getSlide.append(thirdObj)
        
        BeginBtnOult.layer.cornerRadius = 8
        
//        let isOpen = UserDefaults.standard.bool(forKey: "isOpen")
//        if let str = UserDefaults.standard.value(forKey: "name") as? String{
//            self.tittle.append(str)
         
        super.viewDidLoad()
        
//        }

    }
    
    @IBAction func beignBtn(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isOpen")
        performSegue(withIdentifier: "login", sender: nil)
    }
    private func getData(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
            
            var result: Response?
            do{
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print("failed to get data")
            }
            guard let json = result else {
                return
            }
            print(json.results.sunrise)
        })
            task.resume()
    }
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getSlide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! MyCellCollectionViewCell
        let slide = getSlide[indexPath.row]
        
        cell.img.image = UIImage(named: slide.image)
//        self.tittleLbl.text = getSlide.tittle[indexPath.row]
      
            
        
//        if getSlide.image[0] == "0"{
//
//        }else if getSlide.image[0] == "1"{
//            self.tittleLbl.text = getSlide.tittle[indexPath.row]
//        }else if getSlide.image[0] == "2"{
//            self.tittleLbl.text = getSlide.tittle[indexPath.row]
//        }
//
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        let index = Int(offSet + horizontalCenter) / Int(width)
        let slide = getSlide[index]
       self.tittleLbl.text = slide.tittle
       
        
//            UserDefaults.standard.set(true, forKey: "isOpen")
        pageControll.currentPage = index
    }
  
    
}
class Getimg {
    var image: String
//    = ["0","1","2"]
    var tittle: String
//    = ["All your digital profile at one place","Chat with your connections any time","Just tab the phone and get other details"]
    init(img:String,t:String){
        self.image = img
        self.tittle = t
    }
}



struct Response: Codable {
    let results: MyResult
    let  status:String
}

struct MyResult: Codable{
    let sunrise: String
    
}


