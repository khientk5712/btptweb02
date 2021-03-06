
<?php
    if(isset($_POST['add']))
    {
        $dataInsert = [
            'lotId'             => $_POST['lotId'],
            'poLineId'          => $_POST['poLineId'],
            'receiveDate'       => $_POST['receiveDate'],
            'qtyReceiveda'       => $_POST['qtyReceiveda'],
            'amountReceived'    => $_POST['amountReceived'],
            'qtySold'           => $_POST['qtySold'],
            'amountSold'        => $_POST['amountSold'],
            'notea'              => $_POST['notea']
        ];

        if(!insertToDB($dataInsert)){
            var_dump($conn->error);die;
        }
    }
?>
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
                    <div class="search__mb">
                        <a class="search__link" href="#"><i class="fas fa-search search__icon"></i></a>
                    </div>
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
        <div class="grid wide card">
            <div class="card__container">
                <div class="row">
                    <div class="col l-12 m-12 c-12">
                        <div class="row">
                            <div class="card__header col l-12 m-12 c-12">
                                <h1 class="card__title">Tạo mới đơn nhận</h1>
                            </div>
                        </div>
                        <div class="card__body">
                            <form class="row" method="POST" name="received-form" id="received-form" enctype="multipart/form-data">
                                <div class="col l-6 m-12 c-12">
                                    <div class="form-group">
                                        <input type="text" name="lotId" required>
                                        <label>Mã đơn <span>*</span></label>
                                    </div>
                                </div>
                                <div class="col l-6 m-12 c-12">
                                    <div class="form-group">
                                        <input type="text" name="poLineId" required>
                                        <label>Mã đơn hàng<span>*</span></label>
                                    </div>
                                </div>
                                <div class="col l-6 m-12 c-12">
                                    <div class="form-group"> 
                                        <input type="datetime-local" name="receiveDate" > 
                                        <label>Ngày đặt hàng</label> 
                                    </div>
                                </div>
                                <div class="col l-12 m-12 c-12">
                                    <div class="form-group">
                                        <input type="number" name="qtyReceiveda" required>
                                        <label>Số lượng nhận<span>*</span></label>
                                    </div>
                                <div class="col l-12 m-12 c-12">
                                    <div class="form-group">
                                        <input type="number" name="amountReceived" required>
                                        <label>Tổng tiền nhận<span>*</span></label>
                                    </div>
                                </div>
                                <div class="col l-12 m-12 c-12">
                                    <div class="form-group">
                                        <input type="number" name="qtySold">
                                        <label>Số lượng bán<span>*</span></label>
                                    </div>
                                </div>
                                <div class="col l-12 m-12 c-12">
                                    <div class="form-group">
                                        <input type="number" name="amountSold" >
                                        <label>Tiền vốn bán<span>*</span></label>
                                    </div>
                                </div>
                                <div class="col l-12 m-12 c-12">
                                    <div class="form-group">
                                        <textarea rows="6" name="notea"></textarea>
                                        <label>Ghi chú</label>
                                    </div>
                                </div>
                                <div class="col l-2 m-1 c-1">
                                    <div class="backtolist">
                                        <a href="./index.php?page_layout=list"> Quay lại </a>
                                    </div>
                                </div>
                                <div class="col l-12 m-10 c-10">
                                    <button class = "form__button" type="submit" name="add">Thêm đơn nhận</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
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
</script>
