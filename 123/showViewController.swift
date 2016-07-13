//
//  showViewController.swift
//  123
//
//  Created by 珊丹 on 16/7/8.
//  Copyright © 2016年 珊丹. All rights reserved.
//

import UIKit

class showViewController: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet weak var kanname: UITextField!
    @IBOutlet weak var kan: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
       // let data = db.query("delete from cuser")
        
    }
    

    @IBAction func show(sender: AnyObject) {
       
        let data = db.query("select * from tuser")
    
        for var x=0;x<data.count;x++
        {
           let suser=data[x]
           
           
             kan?.text! += "姓名：" + String(suser["name"]!) + " 电话：" + String(suser["mobile"]!)  + " email：" + String(suser["email"]!) +  " 地址：" + String(suser["address"]!) + "\n"
            
        }
        
    }
    
    @IBAction func showname(sender: AnyObject) {
        showname()
    }
    func showname(){
        let c=kanname.text!
        
        let sql = db.query("select * from tuser where name='\(c)'")
        
        for var y=0;y<sql.count;y++
        {
            let suser=sql[y]
 
            kan?.text! += "姓名：" + String(suser["name"]!) + " 电话：" + String(suser["mobile"]!)  + " email：" + String(suser["email"]!) +  " 地址：" + String(suser["address"]!) + "\n"
            
        }
       
    }
    @IBAction func clear(sender: AnyObject) {
        kan.text!=""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
