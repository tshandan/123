//
//  deleteViewController.swift
//  123
//
//  Created by 珊丹 on 16/7/8.
//  Copyright © 2016年 珊丹. All rights reserved.
//

import UIKit

class deleteViewController: UIViewController {
    var db:SQLiteDB!
    @IBOutlet weak var searchtext: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
        // Do any additional setup after loading the view.
    }

    @IBAction func delet(sender: AnyObject) {
        delete()
    }
    @IBAction func deletem(sender: AnyObject) {
        deletem()
    }
    func delete(){
        let a=searchtext.text!
        let sql = "delete from tuser where name='\(a)'"
        let result = db.execute(sql)
        print(result)
   
    }
    func deletem(){
        let b=searchtext.text!
        let sql = "delete from tuser where mobile='\(b)'"
        let result = db.execute(sql)
        print(result)
        
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
