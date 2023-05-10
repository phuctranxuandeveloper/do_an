 <!-- #include file="connect.asp" -->
<%
    ''check
    

    Function Ceil(Number)
        Ceil = Int(Number)
        If Ceil<>Number Then
            Ceil = ceil + 1
        End if  
    End Function

    Function checkPage(con, ret)
        If con = true Then
            Response.Write ret
        Else
            Response.Write ""
        End if
    End function

    page = Request.QueryString("page")
    limit = 3

    If (trim(page) = "") or (isnull(page)) Then
        page = 1
    End if

    offset = (Clng(page) * Clng(limit)) - Clng(limit)


    set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.Prepared = true
    cmdPrep.CommandText = "select COUNT(Promotions.PromotionID) as [count] from Promotions "
    set rs = cmdPrep.execute()
    totalRows = Clng(rs("count"))
    rs.Close()
    connDB.Close()
    set rs = Nothing
    
    'lấy về tổng số trang
    pages = Ceil(totalRows/limit)
    'giới hạn tổng số trang là 4
    Dim range
    If (pages <= 4) Then
        range = pages
    Else
        range = 4
    End if
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IT Store</title>
    <link rel="icon" type="image/png" href="./assets/img/favicon.jpg"/>
    <link rel="stylesheet" href="./assets/css/DBstyle.css">
    <link rel="stylesheet" href="./assets/css/responsove.css">
    <link rel="stylesheet" href="./assets/css/Grid.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.2.0-web/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
    <div class="main">
        <div class="dashboard">
            <div class="row no-gutters">
                <div class="col l-2 m-0 c-0">
                    <div class="dashboard-nav">
                        <div class="dashboard-logo">
                            <img src="./assets/img/logo.jpg" alt="">
                        </div>
                        <div class="dashboard-menu">
                            <ul class="dashboard-menu-list">
                                <li class="dashboard-menu-item"><a href="#" class="dashboard-menu-item-link active"><p><i class="fa-solid fa-house"></i> Home</p> <i class="fa-solid fa-angle-right"></i></a></li>
                                <li class="dashboard-menu-item">
                                    <a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-box-open"></i> Men Product</p> <i id="icon" class="dashboard-menu-item-link-icon fa-solid fa-angle-right"></i>
                                    </a>
                                    <ul class="dashboard-menu-list-sub">
                                        <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Jeans <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                        <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">T-Shirt <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                        <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Polo <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                        <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Underwear <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                    </ul>
                                </li>
                                <li class="dashboard-menu-item">
                                    <a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-box-open"></i> Women Product</p> <i id="icon1" class="dashboard-menu-item-link-icon fa-solid fa-angle-right"></i>
                                    </a>
                                    <ul class="dashboard-menu-list-sub">
                                        <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Jeans <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                        <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">T-Shirt <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                        <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Skirt <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                        <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Underwear <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                    </ul>
                                </li>
                                <li class="dashboard-menu-item"><a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-users"></i> Customer</p> <i class="fa-solid fa-angle-right"></i></a></li>
                                <li class="dashboard-menu-item"><a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-bag-shopping"></i> Order </p> <i class="fa-solid fa-angle-right"></i></a></li>
                                <li class="dashboard-menu-item"><a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-tag"></i> Discount </p> <i class="fa-solid fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="dashboard-nav dashboard-nav-mobile js-nav">
                    <button class="dashboard-close-mobile js-close">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                    <div class="dashboard-logo">
                        <img src="./assets/img/logo.jpg" alt="">
                    </div>
                    <div class="dashboard-menu">
                        <ul class="dashboard-menu-list">
                            <li class="dashboard-menu-item"><a href="#" class="dashboard-menu-item-link active"><p><i class="fa-solid fa-house"></i> Home</p> <i class="fa-solid fa-angle-right"></i></a></li>
                            <li class="dashboard-menu-item">
                                <a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-box-open"></i> Men Product</p> <i id="icon" class="dashboard-menu-item-link-icon fa-solid fa-angle-right"></i>
                                </a>
                                <ul class="dashboard-menu-list-sub">
                                    <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Jeans <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                    <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">T-Shirt <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                    <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Polo <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                    <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Underwear <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                </ul>
                            </li>
                            <li class="dashboard-menu-item">
                                <a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-box-open"></i> Women Product</p> <i id="icon1" class="dashboard-menu-item-link-icon fa-solid fa-angle-right"></i>
                                </a>
                                <ul class="dashboard-menu-list-sub">
                                    <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Jeans <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                    <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">T-Shirt <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                    <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Skirt <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                    <li class="dashboard-menu-item-sub"><a href="#" class="dashboard-menu-item-link-sub">Underwear <i class="sub-icon fa-solid fa-angle-right"></i></a></li>
                                </ul>
                            </li>
                            <li class="dashboard-menu-item"><a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-users"></i> Customer</p> <i class="fa-solid fa-angle-right"></i></a></li>
                            <li class="dashboard-menu-item"><a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-bag-shopping"></i> Order </p> <i class="fa-solid fa-angle-right"></i></a></li>
                            <li class="dashboard-menu-item"><a href="#" class="dashboard-menu-item-link"><p><i class="fa-solid fa-tag"></i> Discount </p> <i class="fa-solid fa-angle-right"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col l-10 m-12 c-12">
                    <div class="dashboard-main">
                        <div class="dashboard-main-header">
                            <button class="dashboard-main-mobile js-btn">
                                <i class="nav-icon fa fa-bars"></i>
                            </button>
                            <div class="dashboard-main-header-search hide-on-mobile-tablet">
                                <input type="text" placeholder="Search...">
                                <button><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                            <div class="dashboard-main-header-login">
                                <h4>Admin</h4>
                                <img src="./assets/img/admin.jpg" alt="" class="admin-avatar">
                                <a href="./website/logout.asp" class="dashboard-main-header-login-link">
                                    <i class="nav-icon fa-solid fa-arrow-right-from-bracket"></i>
                                </a>    
                                <!-- <a href="./website/login.asp" class="dashboard-main-header-login-link">
                                    <i class="fa-solid fa-user"></i>
                                    Login
                                </a> -->
                            </div>
                        </div>
                        <div class="dashboard-main-body">
                            <div class="grid wide">
                                <div class="row">
                                    <div class="col l-12 m-12 c-12">
                                        <div class="dashboard-product">
                                            <div class="dashboard-text">
                                                <h4>Discount</h4>
                                                <a href="" class="dashboard-option-btn dashboard-create">Create</a>
                                            </div>
                                            <div class="form">
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Discount</th>
                                                            <th>Promotion</th>
                                                            <th>From</th>
                                                            <th>To</th>
                                                            <th>Option</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            connDB.open()
                                                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                                                            cmdPrep.ActiveConnection = connDB
                                                            cmdPrep.CommandType = 1
                                                            cmdPrep.Prepared = True
                                                            cmdPrep.CommandText = "SELECT * FROM Promotions ORDER BY PromotionID offset ? rows fetch next ? rows only  "
                                                            cmdPrep.parameters.Append cmdPrep.createParameter("offset", 3, 1, ,offset)
                                                            cmdPrep.parameters.Append cmdPrep.createParameter("limit", 3, 1, ,limit)

                                                            Set Result = cmdPrep.execute
                                                            do while not Result.EOF
                                                        %>
                                                        <tr>
                                                            <td><%=Result1("PromotionID")%></td>
                                                            <td><%=Result1("PromotionName")%></td>
                                                            <td><%=Result1("DiscountRate")%></td>
                                                            <td><%=Result1("StartDate")%></td>
                                                            <td><%=Result1("EndDate")%></td>
                                                                    <td>
                                                                        <div class="admin-option">
                                                                            <a href="addedit.promotion.asp?id=<%=Result("PromotionID")%>" class="admin-option-btn admin-update">Update</a>
                                                                            <a href="delete.promotion.asp?id=<%=Result("PromotionID")%>" class="admin-option-btn admin-delete" data-bs-target="#confirm-delete" title="Delete">Delete</a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                Result1.MoveNext
                                                                loop
                                                                %>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="page">
                                                <ul class="navigation">
                                                    <%
                                                        If (pages > 1) Then
                                                            If (Clng(page) >= 2) Then
                                                    %>
                                                                <li class="navigation-item"><a href="/dashboard/DBDiscount.asp?page=<%=Clng(page) - 1%>" class="navigation-link"><i class="fa-solid fa-chevron-left"></i></a></li> 
                                                    <%
                                                            End If

                                                            for i = 1 to range
                                                    %>
                                                                <li class="navigation-item "><a href="/dashboard/DBDiscount.asp?page=<%=i%>" class="navigation-link <%=checkPage(Clng(i)=Clng(page),"active")%>"><%=i%></a></li>
                                                    <%
                                                            Next

                                                            If (Clng(page) < pages) Then
                                                    %>
                                                                <li class="navigation-item"><a href="/dashboard/DBDiscount.asp?page=<%=Clng(page) + 1%>" class="navigation-link"><i class="fa-solid fa-chevron-right"></i></a></li>
                                                    <%      
                                                            End If  
                                                        End if
                                                    %>
                                                    
                                                </ul>
                                            </div>
                                        </div>                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal delete-box" tabindex="-1" id="confirm-delete">
        <div class="modal-dialog modal-form">
            <div class="modal-heading">
                <i class="fa-solid fa-circle-exclamation"></i>
            </div>
            <div class="modal-content">
                <h4>Are you sure ?</h4>
                <p>Do you really want to delete these records ? This process cannot be undone.</p>
            </div>
            <div class="modal-option">
                <a class="modal-btn modal-btn-clear">Delete</a>
                <button type="button" class="modal-btn-cancel" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>  
    <script type="text/javascript">
        $(document).ready(function(){
            $('.dashboard-menu-item-link').click(function(){
                $(this).next('.dashboard-menu-list-sub').slideToggle('');
                $(this).find('.dashboard-menu-item-link-icon').toggleClass('rotate');
            })
        })
        const Open = document.querySelector(".js-btn");
        const nav = document.querySelector(".js-nav");
        const Close = document.querySelector(".js-close");
        function showNav() {
            nav.classList.add("Open");
        }
        function hideNav() {
            nav.classList.remove("Open");
        }
        Open.addEventListener("click", showNav);
        Close.addEventListener("click", hideNav);
        nav.addEventListener("click",function(e){
            e.stopPropagation();
        })
    </script>
</body>
</html>