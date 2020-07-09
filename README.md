# calculator

Copyright (C) 2020. Gyuho Lee. All rights reserved.

---

calculator는 아이들에게 소프트웨어 개발 교육을 하기위해 개발된 프로그램 입니다. 간단한 4칙 연산만 가능합니다.

.NET 기반의 C# 언어로 개발되었습니다. FormMain, FormAbout 2가지 다이얼로그로 구성되어 있습니다.

---
## 화면 구성
### FormMain
계산기 메일 화면으로 기본적인 4칙 연산을 수행하는 화면이다.

### FormAbout
계산기 저작권 정보를 확인할 수 있는 화면으로 ICONS8 이미지 링크를 포함하고 있다.

**키 이벤트 코드**
```
private void FormMain_KeyDown(object sender, KeyEventArgs e)
{
    switch (e.KeyCode)
    {
        case Keys.D0: 
            {
                button0.PerformClick(); 
            }
            break;
        // 보다 명료하게 코드를 아래와 같이 정리할 수 있습니다.
        case Keys.D1: { button1.PerformClick(); } break;
        case Keys.D2: { button2.PerformClick(); } break;
        case Keys.D3: { button3.PerformClick(); } break;
        case Keys.D4: { button4.PerformClick(); } break;
        case Keys.D5: { button5.PerformClick(); } break;
        case Keys.D6: { button6.PerformClick(); } break;
        case Keys.D7: { button7.PerformClick(); } break;
        case Keys.D8: { button8.PerformClick(); } break;
        case Keys.D9: { button9.PerformClick(); } break;
        default:
            {
                System.Console.WriteLine("Unknown KeyCode: {0}", e.KeyCode);
            }
            break;
    }
}
```

**결과(=) 버튼 이벤트 코드**
```
private void buttonResult_Click(object sender, EventArgs e)
{
    // labelResult 값이 있는 경우에만 처리합니다.
    if (string.IsNullOrEmpty(labelResult.Text) == false)
    {
        // 45+
        // 100+
        // 0123
        // labelResult.Text.Length = 4
        char op = labelResult.Text[labelResult.Text.Length - 1];

        string tempA = labelResult.Text.Remove(labelResult.Text.Length - 1);
        string tempB = labelDisplay.Text.Replace(",", "");
        int a = int.Parse(tempA);
        int b = int.Parse(tempB);
        double c = 0;

        if ((op == '+') == true)
        {
            c = a + b;
        }
        else if (op == '-')
        {
            c = a - b;
        }
        else if (op == '*')
        {
            c = a * b;
        }
        else if (op == '/')
        {
            c = a / b;
        }
        else
        {
            // 위 조건이 모두 맞지 않으면 이 코드가 실행됨
        }

        labelResult.Text = "";
        labelDisplay.Text = c.ToString("#,##0");
    }
}
```

```
private void VisitLink()
        {
            // Change the color of the link text by setting LinkVisited
            // to true.
            linkicon8.LinkVisited = true;
            //Call the Process.Start method to open the default browser
            //with a URL:
            System.Diagnostics.Process.Start(linkicon8.Text);
        }
```
```
종민이는 롤은 하면 맨날 랙이 걸린다면서 롤망겜이라고 한다그러면서 오버워치나 마인크레프트는 재밌게 하면서롤만 욕해요

```
```
종현이형은 모르겠다
```

<img src="./Images/icons8_equals_1.ico" width="100px" height="100px" title="px(픽셀) 크기 설정" alt="RubberDuck"></img><br/>
<img src="./Images/icons8_equals_1.ico" width="30%" height="30%" title="px(픽셀) 크기 설정" alt="RubberDuck"></img>
```
종민이는 영화가 취미라면서 맨날 일어나면 컴퓨터부터 킨다 그리고 발로라느와 디스코드를 키고 찬이를부른다
```


