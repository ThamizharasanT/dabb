//
//  loginTableViewController.swift
//  Dabb
//
//  Created by thamizharasan t on 28/02/22.
//

import UIKit

class loginTableViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var MobileNumberTf: UITextField!

    override func viewDidLoad() {
        
        super.viewDidLoad()
//        tableView.contentInset.top =
        MobileNumberTf.delegate = self
    }
    
    //MOBILE NUMBERE TEXT FIELD LIMIT  FUNCTION
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    @IBAction func GetStartedbtnTouch(_ sender: Any) {
        if let txt = MobileNumberTf.text ,!txt.isEmpty ,txt.count == 10 {
            performSegue(withIdentifier: "OtpVc", sender: nil)
        }else{
            print("MobileNumber minimum 10 numbers")
        }
       
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  indexPath.row == 0 {
            return 200
        }else {
            return UITableView.automaticDimension
        }
    }
}
