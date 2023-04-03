<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Document</title>
    <style>
        * {
            margin: 0;

        }
        html,
        body {
            height: 100%;
        }

        .wrap {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        /* .header 자식 요소에 flex 속성을 사용하기 
            위해 display 속성 flex 변경
        */
        .header {
            height: 65px;
            background-color: #e0af87;
            display: flex;
            align-items: center;
        }

        .tablist {
            height: 70px;
            box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        .content {
            display: flex;
            flex: 1;
        }

        .aside {
            display: flex;
            flex: none;
            width: 400px;
            background-color: #bfbab078;
        }

        .main {
            display: flex;
            flex: 1;
            overflow: auto;
        }

        /*
           ||| logo ||| search > input | button | gnb ||| 로 구성
           logo 영역과 gnb 영역 크기를 고정으로 
           만들어 보자. 
        */
        .logo,
        .gnb {
            flex: none;
            padding: 20px 30px;
            background-color: #eb8c10;
        }

        /*search 자식들을 flex 요소를 사용하자. 
          search 영역도 고정 크기로 만들어 보자.  
        */
        .search {
            display: flex;
            width: 400px;
            margin-right: 10px;
        }

        input {
            height: 35px;
            width: 360px;
        }

        .search_button {
            height: 40px;
            margin-left: 10px;
            border: 0;
            background-color: #eb8c10;
        }

        .gnb {
            margin-left: auto;
        }
        .m_wrap {
            height: 100px;
            display: flex;
            flex-direction: column;
            margin-top: auto;
        }
        /*
            푸터에 해당하는 요소(.flex-item 클래스)에 margin-top: auto 속성을 적용한다.
        */
        footer {
            background-color: #e0af87;
            // margin-top: auto;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
    <div id="wrap" class="wrap">
    
    
        <header class="header">
        
            <div class="logo">logo</div>
            
            <div class="search">
                <input type="text" class="search_input">
                <button class="search_button">검색</button>
            </div>
            
            <div class="gnb">gnb</div>
            
        </header>
        
        
        
        <div class="tablist"></div>
        
        <div class="content">
            <div class="aside"></div>
            
            <div class="main">
            	
            </div>
            
        </div>
        
        <div class="m_wrap">
            <footer>
                <span>footer</span>
            </footer>
        </div>
        
    </div>
</body>

</html>