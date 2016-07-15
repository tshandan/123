//
//  updatabyname.swift
//  123
//
//  Created by 珊丹 on 16/7/15.
//  Copyright © 2016年 珊丹. All rights reserved.
//

import UIKit

class updatabyname: UIViewController {
    
    var db:SQLiteDB!
    
    
    @IBOutlet weak var updatenum: UITextField!
    @IBOutlet weak var updatename: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
        // let data = db.query("delete from cuser")
        
    }
    
 
    @IBAction func updatesave(sender: AnyObject) {
        save()
        showAlert()
    }
    
    
    func save(){
        let x=updatename.text!
        let y=updatenum.text!
        let sql = "update tuser set mobile='\(y)' where name='\(x)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    func showAlert() {
        var alert = UIAlertView(title: "提示",message: " 更改联系人电话成功！",delegate: self,cancelButtonTitle: "确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        alert.show()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
