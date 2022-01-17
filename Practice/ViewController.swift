//
//  ViewController.swift
//  Practice
//
//  Created by Pawan Ravish on 2022-01-15.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var SongProgress: UISlider!
    @IBOutlet weak var VolumeProgress: UISlider!
    
    
    @IBOutlet weak var PlayOutLet: UIBarButtonItem!
    
    
    var player=AVAudioPlayer()
   // var path=Bundle.main.path(forResource: "Photoan", ofType: ".mp3")
    
    var timer=Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // do{
            
       //     try player=AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
            
        //    SongProgress.maximumValue=Float(player.duration)
            
        
      //  }
      //  catch {
     //       print(error)
  //      }
        
        
        PlayAudioWithShaking(forResource: "Insane", ofType: "mp3")
        
        
      //  let tapping=UITapGestureRecognizer(target: self, action: #selector(tappingDefined))
   //     view.addGestureRecognizer(tapping)
        
        
   //     let swipeLeft = UISwipeGestureRecognizer (target: self, action: #selector(Swiped))
     //   swipeLeft.direction = .left
   ///     view.addGestureRecognizer(swipeLeft)
     //   let swipeRight = UISwipeGestureRecognizer (target: self, action: #selector(Swiped))
    //    swipeRight.direction = .right
       // view.addGestureRecognizer(swipeRight)
        
        
  //  }
 //   @objc func tappingDefined(){
     //   print ("tapping detected ")
   //
        
  //  }
   // @objc func Swiped (gesture:UISwipeGestureRecognizer){
    //    switch gesture.direction {
     //   case .left :
    //    print("left swiped ")
    //    case .right :
    //    print("right swiped ")
     //   default : break
     //   }
    }
   

    
    
    @IBAction func PlaySong(_ sender: UIBarButtonItem) {
        
        if player.isPlaying{
            sender.image = UIImage(systemName: "play.fill")
            player.pause()
            timer.invalidate()
            
            
            
            
            
        }
        else {
            
            sender.image=UIImage(systemName: "pause.fill")
            player.play()
            timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateSeekBar), userInfo: nil, repeats: true)
            
        }
    }
    
    @IBAction func StopSong(_ sender: UIBarButtonItem) {
        player.stop()
        player.currentTime=0
        timer.invalidate()
        SongProgress.value=SongProgress.minimumValue
        PlayOutLet.image=UIImage(systemName: "play.fill")
    }
    
    

@objc func UpdateSeekBar(){
    SongProgress.value = Float(player.currentTime)
    player.play()
    if SongProgress.value==SongProgress.minimumValue{
        
        PlayOutLet.image=UIImage(systemName: "play.fill")
        
    }
    
    
    
}
    
    
    @IBAction func VolumeControler(_ sender: UISlider) {
        
        
        player.volume=VolumeProgress.value
        
    }
    
    
    @IBAction func Progress(_ sender: UISlider) {
        player.currentTime=TimeInterval(SongProgress.value)
        
        if player.isPlaying{
            player.play()
        }
    
    
    
    }
    
    func PlayAudioWithShaking (forResource name: String?,ofType type: String?){
        
        
       let path=Bundle.main.path(forResource: name, ofType: type)
        
        
        do{
             
             try player=AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
             
            SongProgress.maximumValue=Float(player.duration)
             
         
         }
         catch {
             print(error)
        }
        player.play()
        PlayOutLet.image=UIImage(systemName: "pause")
        
        
        
        
        
        
        
    }
    // feature Shake motion
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake{
           // print("caution !! phone is SHaking ")
            
            
            
            
            let audioArray=["Brown Munde","Excuses","Insane","Photoan","Udaarian 2"]
            
            let randomNumber=Int.random(in: 0..<audioArray.count)
            let path=Bundle.main.path(forResource: audioArray[randomNumber], ofType: ".mp3")
            
            
            PlayAudioWithShaking(forResource: audioArray[randomNumber], ofType: "mp3")
            
            
        }    }
    
   
    
    
    
    
    
    
    
    
}


