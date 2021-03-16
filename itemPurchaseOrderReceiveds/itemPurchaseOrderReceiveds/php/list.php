<?php require_once('config.php');?>
<?php
    $sql= "SELECT *FROM `itempurchaseorderreceiveds`  join `itempurchaseorderdetails` ON itempurchaseorderreceiveds.poLineId= itempurchaseorderdetails.poLineId";
    $query=mysqli_query($conn,$sql) ; 
     while ( $row= mysqli_fetch_assoc($query)){
         $data[]=$row;
     }
     ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Received</title>
    <link rel="shortcut icon" href="./assets/img/logo.png" type="image/png">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./css/style/.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <style>
        .col_1{
            width: 5%;
        }
        th,td{
            border: 1px solid;
            text-align: center;
        }

    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Lưới Grid -->
        <header>
            <div class="grid">
                <div class="navbar">
                    <div class="search">
                        <form action="#" class="search__box">
                            <a class="search__link" href="#"><i class="fas fa-search search__icon"></i></a>
                            <input type="text" class="search__input" placeholder="Search here...">
                        </form>
                    </div>
                    <div class="account">
                        <ul class="account__list">
                            <li  class="account__items language">
                                <a id ="btn_lang" class="language__link" href="#">
                                    <img src="img/vietnam_flag.jpg" alt="vietnam flag">
                                    Vi
                                </a>
                            </li>
                            <li class="account__items user__icon "><i class="far fa-envelope"></i></li>
                            <li class="account__items user__icon "><i class="far fa-bell"></i></li>
                            <li class="account__items">
                                <a href="#" class="account__link">
                                    <img class="account__img" src="img/user.png" alt="user">
                                </a>
                            </li>
                        </ul>
                        <!-- Drop_box_Language -->
                        <div id="dropbox" class="dropbox">
                            <ul class="dropbox__list">
                                <li class="dropbox__items">
                                    <a class="dropbox__link" href="#">
                                        <img src="img/vietnam_flag.jpg" alt="vietnam flag">
                                        Vietnamese
                                    </a>
                                </li>
                                <li class="dropbox__items">
                                    <a class="dropbox__link" href="#">
                                        <img src="img/england_flag.png" alt="england flag">
                                        English
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main -->
        <div class="app">
            <div class="grid">
                <div class="container">
                    <div class="items">
                        <div class="items__infor">
                            <h1 class="items__title">
                                Received list
                            </h1>
                            <p class="items__detail">
                                Đây là nơi bạn theo dõi thông tin đơn hàng  và thực hiện các chức năng có liên quan.
                            </p>
                        </div>
                        <div class="btn__genernal">
                            <button onclick="window.location.href='index.php?page_layout=add';" class="items__add">
                                <i class="fas fa-plus items__icon "></i>
                                <p>Tạo mới</p>
                            </button>
                            <button onclick="window.location.href='index.php?page_layout=inpdf';" class="items__add">
                                <i class="fas fa-download items__icon"></i>
                                <p>In danh sách</p>
                            </button>
                        </div>
                    </div>

                    <div class="content">
                        <table class="data ">
                            <thead class="data__title">
                                <tr class="table__title">
                                    <th class="col_1">Mã đơn </th>
                                    <th class="col_1">Mã đơn hàng</th>
                                    <th class="col_1">Ngày nhận</th>
                                    <th class="col_1">Số lượng nhận</th>
                                    <th class="col_1">Tổng tiền nhận</th>
                                    <th class="col_1 ">Số lượng bán</th>
                                    <th class="col_1">Tiền vốn bán</th>
                                    <th class="col_1" style="text-align: center">Ghi chú</th>
                                    <th class="col_1"style="text-align: center">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody class="data_content">
                                <?php
                                   foreach($data as $data){?>
                                        <tr class="table__title">
                                        <td class="col_1"><?php echo $data['lotId'];?> </td>
                                        <td class="col_1"><?php echo $data['poLineId'];?> </td>
                                        <td class="col_1"><?php echo $data['receiveDate'];?> </td>
                                        <td class="col_1"><?php echo $data['qtyReceiveda'];?> </td>
                                        <td class="col_1"><?php echo $data['amountReceived'];?> </td>
                                        <td class="col_1"><?php echo $data['qtySold'];?> </td>
                                        <td class="col_1"><?php echo $data['amountSold'];?> </td>
                                        <td class="col_2" style="text-align: center"><?php echo $data ['notea'];?></td>
                                        <td>
                                        <div class="btn">
                                            <div class="btn__view">
                                                    <a href="./index.php?page_layout=view" class="btn__link">
                                                        <i class="btn_icon far fa-eye"></i>
                                                    </a>
                                            </div>
                                            <div class="btn__edit">
                                                <a href="./index.php?page_layout=edit&lotId=<?php echo $data['lotId'];?>" class="edit__link">
                                                    <i class="btn_icon fas fa-pencil-alt"></i>
                                                </a>
                                            </div>
                                            <div class="btn__delete">
                                                <a href="index.php?page_layout=delete&lotId=<?php echo $data['lotId'];?>" class="data_link">
                                                    <i class="btn_icon far fa-trash-alt"></i>
                                                </a>
                                            </div>
                                        </div></td>
                                        </tr>
                                   <?php }
                                ?>
                                 <!-- <tr class="table__content">
                                    <td class="">ORD2022</td>
                                    <td class="">ORD2021</td>
                                    <td class="date_received">06/03/2021</td>
                                    <td class="qty_received">12000</td>
                                    <td class="amount_received">7500000</td>
                                    <td class="qty_sold">20</td>
                                    <td class="amount_sold">40</td>
                                    <td class="note">rdtu000</td>
                                    <td> -->
                                        
                                    </td> 
                                </tr> 
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagi">
                            <li class="pagi__item pagi__action pagi__prev is-disabled">
                            <i class="pagi__icon fal fa-angle-left"></i>
                            </li>
                            <li class="pagi__item is-active">1</li>
                            <li class="pagi__item">2</li>
                            <li class="pagi__item">3</li>
                            <li class="pagi__item">4</li>
                            <li class="pagi__item">5</li>
                            <li class="pagi__item pagi__action pagi__next">
                            <i class="pagi__icon fal fa-angle-right"></i>
                            </li>
                    </ul>
                    </div>
            </div>
        </div>



<script >
document.getElementById("btn_lang").addEventListener("click",function()
{
var drbox = document.getElementById("dropbox");
if (drbox.style.display == "block")
{
drbox.style.display = "none";
}
else 
{
drbox.style.display = "block";
}
})


function Del(name) {
return confirm("Bạn có chắc chắn muốn xoá sản phẩm: " + name + " không?");
}
</script>
</body>
</html>