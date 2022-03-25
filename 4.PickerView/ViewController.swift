//
//  ViewController.swift
//  4.PickerView
//
//  Created by 이병현 on 2022/03/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10 // 이미지의 파일명을 저장할 배열의 최대 크기를 지정
    let PICKER_VIEW_COLUMN = 1 // 피커 뷰의 열의 개수를 지정함
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg",] // 이미지의 파일명을 저장할 배열
    @IBOutlet var PickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM { // i라는 변수를 0부터 MAX_ARRAY_NUM보다 작을때까지 루프 실행 (0~9까지)
            let image = UIImage(named: imageFileName[i]) // image라는 변수 선언. 생성한 이미지를 image 변수 할당
            imageArray.append(image) // imageArray 배열에 방금 만든 image 추가
        }
        
        lblImageFileName.text = imageFileName[0] // lblImageFileName 레이블에 ImageFileName 배열의 첫번째파일명 출력
        imageView.image = imageArray[0] // 이미지 뷰에 첫 번째 이미지 나타남
    }
    
    // returns the number of 'columns' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
        // 피커 뷰에게 컴포넌트의 수를 정수값으로 넘겨주는 델리게이트 메서드. 피커 뷰의 컴포넌트는 피커 뷰에 표시되는 열의 개수를 의미
        // 여기서는 PICKER_VIEW_COLUMN 값인 1을 넘겨줌
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent
        component: Int) -> Int {
        return imageFileName.count
        // numberOfComponent 인수를 가지는 델리게이트 메서드. 피커 뷰에게 컴표넌트의 열의 개수를 정수값으로 넘겨줌.
        // 이 값은 피커 뷰 해당 열에서 선택할 수 있는 행의 개수를 의미. 여기서는 배열 imageFileName의 개수 값인 10을
        // imageFileName.count를 통해 넘겨줌
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent
        componet: Int) -> String? {
        return imageFileName[row]
        // titleForRow 인수를 가지는 델리게이트 메서드임. 파커 뷰에게 컴포넌트의 각 열의 타이틀을 문자열 값으로 넘겨줌.
        // 여기서는 imageFileName에 저장되어 있는 파일명을 넘겨줌
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
        inComponent componet: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row] // 사용자가 피커 뷰의 룰렛에서 산택한 row 값을 사용하여 imageArray 배열에서
        // row 값에 해당하는 이미지를 가지고 옴. 그리고 가져온 이미지를 이미지 뷰의 아웃렛 변수인 imageView.image에 저장
    }
        // 사용자가 피커 뷰의 룰렛에서 선택한 row 값을 사용하여 imageFileName 배열에서 row 값에 해당하는 문자 열을 가지고 옴.
        // 가져온 문자열을 레이블의 아웃렛 변수인 lblImageFileName.text 에 저장
}

