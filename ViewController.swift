//
//  ViewController.swift
//  Alert
//
//  Created by 이서현 on 07/01/2020.
//  Copyright © 2020 이서현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imgOn=UIImage(named: "lamp-on.png")
    let imgOff=UIImage(named: "lamp-off.png")
    let imgRemove=UIImage(named: "lamp-remove.png")
    
    var isLampOn=true

    @IBOutlet var lampImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image=imgOn
    }
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            let lampOnAlert=UIAlertController(title: "Warning", message: "현재 ON 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction=UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert,animated: true,completion: nil)
        }else{
            lampImg.image=imgOn
            isLampOn=true
        }
    }

    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            let lampOffAlert=UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction=UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image=self.imgOff
                self.isLampOn=false
            })
            let cancelAction=UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert,animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert=UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction=UIAlertAction(title: "아니오, 끕니다(OFF).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image=self.imgOff
            self.isLampOn=false
        })
        let onAction=UIAlertAction(title: "아니오, 켭니다(ON).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image=self.imgOn
            self.isLampOn=true
        })
        let removeAction=UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image=self.imgRemove
            self.isLampOn=false
        })
        
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert,animated: true, completion: nil)
    }
    
}

