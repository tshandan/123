//
//  ViewController.swift
//  book
//
//  Created by 20141105039 on 16/7/4.
//  Copyright © 2016年 srf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBAction func save(sender: AnyObject) {
        saveUser()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,name varchar(20),mobile varchar(20),email varchar(20),adress)")
        //如果有数据则加载
      
        
    }
    
    
    //从SQLite加载数据
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存数据到SQLite
    func saveUser() {
        let name = self.name.text!
        let phone = self.phone .text!
        let address = self.address.text!
        let email = self.email.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into user(name,mobile,email,adress) values('\(name)','\(phone)','\(email)','\(address)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
}

