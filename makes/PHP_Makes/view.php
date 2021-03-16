<?php
    $id = $_GET['id'];
    $sql_up = "SELECT * FROM makes WHERE makeId ='$id'";
    $query_up = mysqli_query($connect, $sql_up);
    $row_up = mysqli_fetch_assoc($query_up);

    // if(isset($_POST['submit'])) {

    //     $makeId = $_POST['makeId'];
    //     $makeName = $_POST['makeName'];
    //     $remark = $_POST['remark'];
    //     $sql = "UPDATE makes SET makeId='$makeId', makeName='$makeName', remark='$remark', updated_date=NOW() WHERE makeId ='$id'";

    //     $query = mysqli_query($connect,$sql);
    //     header('location: index.php?page_layout=list');
    // }

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
                        <li  class="account__makes language">
                            <a id ="btn_lang" class="language__link" href="#">
                                <img src="./assets/img/vietnam_flag.jpg" alt="vietnam flag">
                                Vi
                            </a>
                        </li>
                        <li class="account__makes user__icon "><i class="far fa-envelope"></i></li>
                        <li class="account__makes user__icon "><i class="far fa-bell"></i></li>
                        <li class="account__makes">
                            <a href="#" class="account__link">
                                <img class="account__img" src="./assets/img/user.png" alt="user">
                            </a>
                        </li>
                    </ul>
                    <!-- Drop_box_Language -->
                    <div id="dropbox" class="dropbox">
                        <ul class="dropbox__list">
                            <li class="dropbox__makes">
                                <a class="dropbox__link" href="#">
                                    <img src="./assets/img/vietnam_flag.jpg" alt="vietnam flag">
                                    Vietnamese
                                </a>
                            </li>
                            <li class="dropbox__makes">
                                <a class="dropbox__link" href="#">
                                    <img src="./assets/img/england_flag.png" alt="england flag">
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
                                <h1 class="card__title">Thông tin nhà sản xuất</h1>
                            </div>
                        </div>
                        <div class="card__body">
                            <form class="row" method="POST" name="makes-form" id="makes-form" enctype="multipart/form-data">
                                <div class="col l-6 m-12 c-12">
                                    <div class="form-group">
                                        <input disabled type="text" name="makeId" required value="<?php echo $row_up['makeId'];?>">
                                        <label>Mã nhà sản xuất<span>*</span></label>
                                    </div>
                                </div>
                               
                                <div class="col l-12 m-12 c-12">
                                    <div class="form-group">
                                        <input disabled type="text" name="makeName" required value="<?php echo $row_up['makeName'];?>">
                                        <label>Tên nhà sản xuất<span>*</span></label>
                                    </div>
                                </div>
                               
                                <div class="col l-12 m-12 c-12">
                                    <div class="form-group">
                                        <textarea disabled rows="2" name="remark"><?php echo $row_up['remark'];?></textarea>
                                        <label>Mô tả nhà sản xuất</label>
                                    </div>
                                </div>
                               
                            </form>
                            <div class="row">
                                <div class="col l-12 m-12 c-12">
                                    <button onclick="window.location.href='index.php?page_layout=edit&id=<?php echo $row_up['makeId'];?>';" class = "form__button" >Sửa thông tin nhà sản xuất</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

    <footer class="footer">
        <div class="grid wide">
            <div class="footer__grid">
                <div class="row">
                    <div class="col l-12 m-12 c-12">
                        <div class="footer__box">
                            <div class="footer__detail">
                                <p class="footer__policy">
                                    <a href="#" class="policy__link"> Privacy Policy</a>
                                </p>
                                <p class="footer__use">
                                    <a href="#" class="use__link">Terms of Use</a>
                                </p>
                            </div>
                            <div class="footer__copyright">
                                <p>Copyright &#169; by PTP</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
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
