<?php
    require_once("../config/dbconnect.php")
?>
<?php
    $search = $_POST['data'];
    $sql = "SELECT `makeId`,`makeName`, `remark` FROM `makes` WHERE makeId LIKE '%$search%' OR makeName LIKE '%$search%'";
    $query = mysqli_query($connect,$sql);
    //Lấy ra số bản ghi
    $num_row = mysqli_num_rows($query);
    if ($num_row > 0) {
        while($row = mysqli_fetch_row($query)){?>
            <tr class="table__content">
                <td data-label="Mã nhà sản xuất" class=""><?php echo $row[0]; ?> </td>
                <td data-label="Tên nhà sản xuất"><?php echo $row[1]; ?> </td>
                <td data-label="Mô tả">
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
    } else {
       echo '<h3 style="padding: 10px 0;">Không tìm thấy bản ghi hợp lệ !!</h3>';
    }
    ?>

