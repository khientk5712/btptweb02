<?php
    $sql = "SELECT `makeId`, `makeName`, `remark` FROM `makes`";
    $query = mysqli_query($connect,$sql);
?>
<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Dashboard makes</title>
    <link rel="shortcut icon" href="./assets/img/logo.png" type="image/png">
    <link rel="stylesheet" href="../assets/css/grid.css">
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/style.css?v=1.0.2">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
</head> -->
<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".search__input").keyup(function() {
                var txt = $(".search__input").val();
                $.post("./PHP_makes/search.php", {data: txt}, function(data) {
                    $(".data").html(data);
                });
            });
        });
    </script>
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
            <div class="grid">
                <div class="container">
                    <div class="makes">
                        <div class="makes__infor">
                            <h1 class="makes__title">
                                Producer List
                            </h1>
                            <p class="makes__detail">
                                Đây là nơi bạn theo dõi thông tin các nhà sản xuất của mình và thực hiện các chức năng có liên quan.
                            </p>
                        </div>
                        <div class="btn__genernal">
                            <button onclick="window.location.href='index.php?page_layout=add';" class="makes__add">
                                <i class="fas fa-plus makes__icon "></i>
                                <p>Tạo mới</p>
                            </button>
                            <button class="makes__add">
                                <i class="fas fa-download makes__icon"></i>
                                <p>In danh sách</p>
                            </button>
                        </div>
                    </div>

                    <div class="content">
                        <table
                         class="content-table">
                            <thead class="data__title">
                                <tr class="table__title">
                                    <th data-label="Mã nhà sản xuất">Mã nhà sản xuất</th>
                                    <th data-label="Tên nhà sản xuất" class="col_3">Tên nhà sản xuất</th>
                                    <th data-label="Ghi chú" class="col_3">Ghi chú</th>
                                    <th data-label="Thao tác">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody class="data">
                                <?php
                                while($row = mysqli_fetch_row($query)){?>
                                    <tr class="table__content">
                                        <td data-label="Mã nhà sản xuất" class=""><?php echo $row[0]; ?> </td>
                                        
                                        <td data-label="Tên nhà sản xuất"><?php echo $row[1]; ?> </td>
                                        <td data-label="Ghi chú">
                                            <p class="makes__remark">
                                            <?php echo $row[2]; ?>
                                            </p>
                                        </td>
                                        <td data-label="Thao tác">
                                            <div class="btn">
                                                <div class="btn__view">
                                                    <a href="./index.php?page_layout=view&id=<?php echo $row[0];?>" class="btn__link">
                                                        <i class="btn_icon far fa-eye"></i>
                                                    </a>
                                                </div>
                                                <div class="btn__edit">
                                                    <a href="./index.php?page_layout=edit&id=<?php echo $row[0];?>" class="btn__link">
                                                        <i class="btn_icon fas fa-pencil-alt"></i>
                                                    </a>
                                                </div>
                                                <div class="btn__delete">
                                                    <a onclick="return Del('<?php echo $row[1];?>')" href="./index.php?page_layout=delete&id=<?php echo $row[0];?>" class="btn__link">
                                                        <i class="btn_icon far fa-trash-alt"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                    <!-- Pagination -->
                    <ul class="pagi">
                            <li class="pagi__make pagi__action pagi__prev is-disabled">
                            <i class="pagi__icon fal fa-angle-left"></i>
                            </li>
                            <li class="pagi__make is-active">1</li>
                            <li class="pagi__make">2</li>
                            <li class="pagi__make">3</li>
                            <li class="pagi__make">4</li>
                            <li class="pagi__make">5</li>
                            <li class="pagi__make pagi__action pagi__next">
                            <i class="pagi__icon fal fa-angle-right"></i>
                            </li>
                    </ul>
                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="grid">
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


        function Del(name) {
            return confirm("Bạn có chắc chắn muốn xoá nhà sản xuất này: " + name + " không?");
        }
    </script>
<!-- </body>
</html> -->
