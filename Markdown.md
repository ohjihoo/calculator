# 마크다운 문법

문단과 문단 사이는 빈 줄(엔터키 두 번)로 구분한다.

첫번째 문단

두번째 문단

라인 그리기 '---' or '___' 3개 이상으로 표시

---
___

제목은 # 갯수로 강조(최대 6개까지 사용)

# 큰 제목
## 중간 제목
### 작은 제목
#### 4번째 제목
##### 5번째 제목
###### 6번째 제목


이탤릭체:

*이탤릭체*, _이탤릭체_

볼드체:

**볼드체**, __볼드체__

삭제표시:

~~삭제표시~~

하이퍼링크

[링크명](http://www.example.com), [링크명](http://www.example.com "사이트 제목")

[Google (https://google.com)](https://google.com, "google link")

https://google.com

<hatsalmaroo@gmail.com>

블럭 인용: '>' 기호를 사용

> This is a first blockqute.
>> This is a second blockqute.
>>> This is a third blockqute.

순서있는 목록

1. 첫번째
2. 두번째
3. 세번째

순서없는 목록: '*' or '+' or '-'

* 첫번째
* 두번째
* 세번째

+ 첫번째
+ 두번째
+ 세번째

- 첫번째
- 두번째
- 세번째

* 빨강
  * 녹색
    * 파랑

+ 빨강
  + 녹색
    + 파랑

- 빨강
  - 녹색
    - 파랑

* 1단계
  - 2단계
    + 3단계
      + 4단계

코드블럭: '```' 문자 3개

```
private void buttonOk_Click(object sender, EventArgs e)
{
    this.DialogResult = DialogResult.OK;
    this.Close();
}
```

이미지 표시

![계산기 이미지](./Images/icons8_calculator.ico "툴팁: 계산기 아이콘")

그 외 이미지 표시
<img src="./Images/icons8_calculator.ico" width="100px" height="100px" title="px(픽셀) 크기 설정" alt="RubberDuck"></img><br/>
<img src="./Images/icons8_calculator.ico" width="30%" height="30%" title="px(픽셀) 크기 설정" alt="RubberDuck"></img>

