//
//  ViewController.swift
//  UpDownGame
//
//  Created by kyuhyeon Lee on 2/24/25.
//

import UIKit

class ViewController: UIViewController {        //클래스 안에 들어있는 함수는 메서드이다.
    
    var randomValue: Int = 0        //처음에 앱을 실행했을 때 할당이 될 기본 값
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!      //몇번 시도했는지
    @IBOutlet weak var sliderValueLabel: UILabel!       //슬라이더의 현재값이 얼마나 됐는지
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .normal)
        reset()
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {     //대소문자 조심IBAction, IBAction은 스토리보드에서 버튼 같은 ui요소와 연결된 함수이다. (_ sender: UISlider)은 사용자가 슬라이더를 조작할때 실행되고, sender.value를 통해 현재 슬라이드 값을 가져올 수 있다.
        print(sender.value) //사용자가 슬라이더를 움직일 때마다 여기에 값들이 들어옴
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
        //viewDidLoad()   //viewDidLoad를 호출하고싶다 하면 viewDidLoad 적고 소괄호 열고 닫으면 실행됨
    }

    @IBAction func touchUpHitButton(_ sender: UIButton) {   //버튼 눌렀을 때 슬라이더 현재 값 출력, func는 함수 선언할때 사용하는 키워드, (_ sender: UIButton)은 이벤트가 발생한 버튼 객체를 전달하는 매개변수
        print(slider.value)
        let hitValue: Int = Int(slider.value)       //사용자가 잡아끄는 값을 소수값까지 표현하기 위해
        slider.value = Float(hitValue)      //float을 썼다, slide  r은 애초에 float을 사용해 이용하도록 만들어졌다. 미세한 값까지 포착해서 실수값을 사용자에게 전달.
        tryCount = tryCount + 1     //현재 시도횟수에서 + 1
        tryCountLabel.text = "\(tryCount) / 5"      //tryCount 값을 문자열("\(tryCount)")로 변환하고, " / 5"를 붙여서 표시
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {     //오류나면 오른쪽마우스 클릭, refactor, 바꾸고자 하는 이름으로 변경
        print("tuoch up reset button")
        reset()
    }
    
    func reset() {
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0        //사용자가 몇번 시도했는가를 초기화 한다.
        tryCountLabel.text = " 0 / 5"
        slider.minimumValue = 0     //최소값을 0으로 초기화
        slider.maximumValue = 0     //최대값을 0으로 초기화
        slider.value = 15       // value라는 값을 15로 준다.
        minimumValueLabel.text = "0"        //minimumvaluelable을 처음엔 0으로 초기화.
        maximumValueLabel.text = "30"       //maximumvaluelable을 30으로 바꿈
        sliderValueLabel.text = "15"        //슬라이더의 현재값을 텍스트로 15할당
    }
}

