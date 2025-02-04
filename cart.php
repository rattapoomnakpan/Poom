<?php  
session_start();
include('connection/connection.php');
// ตรวจสอบว่า user_id มีใน session หรือไม่
if (!isset($_SESSION['user_id'])) {
    // ถ้าไม่มี user_id ใน session ให้ redirect ไปที่หน้าล็อกอิน
    header("Location: login.php"); // เปลี่ยน login.php เป็น URL ของหน้าล็อกอินของคุณ
    exit(); // หยุดการทำงานของโค้ดที่เหลือ
} else {
    // ถ้ามี user_id ให้ทำงานตามปกติ
    $id = $_SESSION['user_id'];
    // ส่วนของโค้ดที่ต้องการให้ทำงานต่อไป
}

$id = $_SESSION['user_id'];
$sql = sprintf("SELECT * FROM tb_user WHERE id = '%s'",$id);
// echo $sql;
// exit();
$query = mysqli_query($connection, $sql);
$result = mysqli_fetch_assoc($query);
?>

<!DOCTYPE html>
<html lang="en">
<?php include('includes/head.php'); ?>

<style>
    .table{
        
        margin-left: center ;
    }
    .table img {
    width: 100px;
    height: auto;
    object-fit: cover;
}

</style>
<body>

<?php include('includes/navbar/navbarcart.php'); ?>

<div class="container" >
    <form id="form1" method="POST" action="insert_cart.php">
        <div class="row" >
            <div class="col-md-12 mt-5">
                <center>
                    <h2>สั่งซื้อสินค้า</h2>
                </center>
            <table style="text-align:center" class="table table-hover">
                <tr>
                    <th style="width: 10%;">ลำดับที่</th>
                    <th >รูปภาพ</th>
                    <th style="width: 25%;">ชื่อสินค้า</th>
                    <th >ราคา</th>
                    <th style="width: 15%;">จำนวนที่สั่งซื้อ</th>
                    <th style="width: 15%;">ราคารวม</th>
                    <th style="width: 20%;">เพิ่ม - ลด</th>
                    <th style="width: 300px;">ลบรายการ</th>
                </tr>

                <?php 
                            // Initialize session if not already started
                            if(session_status() == PHP_SESSION_NONE) {
                                session_start();
                            }

                            // Check if 'intLine' is set, if not initialize it
                            if (!isset($_SESSION["intLine"])) {
                                $_SESSION["intLine"] = 0; // Default value, adjust as needed
                            }

                            $Total = 0;
                            $sumprice = 0;
                            $m = 1;

                            for ($i = 0; $i <= (int) $_SESSION["intLine"]; $i++) {
                                if (isset($_SESSION["strProductID"][$i]) && $_SESSION["strProductID"][$i] != "") {
                                    $sql1 = "SELECT * FROM tb_product WHERE id = '".$_SESSION["strProductID"][$i]."' ";
                                    $result1 = mysqli_query($connection, $sql1);
                                    $row_pro = mysqli_fetch_assoc($result1);

                                    $_SESSION["price"] = $row_pro['price'];
                                    $Total =  $_SESSION["strQty"][$i];
                                    $sum = $Total * $row_pro['price'];
                                    $sumprice += $sum;
                                    $_SESSION["sum_price"] = $sumprice;

                        ?>

                    <tr>
                        <td><?=$m?></td>
                        <td><img src="admin/upload/product/<?=$row_pro['image']?>" class="card-img-top" alt="Product Image" width="100px"></td>
                        <td><?=$row_pro['title']?></td>
                        <td><?=$row_pro['price']?></td>
                        <td><?=$_SESSION["strQty"][$i]?></td>
                        <td><?=number_format($sum)?></td>
                        <td style="width: 20%;">
                            <a href="order.php?id=<?=$row_pro['id']?>" class="btn btn-outline-primary">+</a>
                            <?php if($_SESSION["strQty"][$i] >1){ ?>
                            <a href="order_del.php?id=<?=$row_pro['id']?>" class="btn btn-outline-primary">-</a>
                            <?php }?>
                        </td>
                        <td>
                            <a href="pro_delete.php?Line=<?=$i?>" 
                            onclick="return confirm('คุณต้องการลบ <?=$row_pro['title']?> หรือไม่?');" class="btn btn-sm btn-danger">
                                ลบ
                            </a>
                        </td>
                    </tr>
                <?php
                    $m = $m + 1;  
                } 
                }
                ?>
                <tr style="font-weight: bold;">
                    <td colspan="6" class="text-right">ราคารวมทั้งหมด</td>
                    <td><?=number_format($sumprice)?></td> 
                    <td>บาท</td>
                </tr>
            </table>

                <div class="" style="margin-left: 850px; width: 300px; margin-top:10px;">
                    <a href="product.php"><button type="button" class="btn btn-outline-secondary">เลือกสินค้า</button></a>
                    <a style="margin-left: 20px;" href="">
                        <button type="submit" class="btn btn-outline-primary">ยืนยันการสั่งซื้อ</button></a>
                </div>
            </div>

            <div class="row">
                <div class="col-4">
                    <div class="alert alert-success" h4 role="alert">
                        ข้อมูลสำหรับการจัดส่งสินค้า
                    </div>
                        <div class="row">
                            <div class="col-12 col-md-6">
                                <label for="firstname" class="form-label">ชื่อ <span class="text-danger">*</span></label>
                                <input value="<?=$result['firstname']?>" id="firstname" autocomplete="off" name="firstname" type="text" class="form-control" autocomplete="off" required>
                            </div>
                            <div class="col-12 col-md-6">
                                <label for="lastname" class="form-label">นามสกุล <span class="text-danger">*</span></label>
                                <input value="<?=$result['lastname']?>" id="lastname" name="lastname" type="text" class="form-control" required >
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">ที่อยู่ <span class="text-danger">*</span></label>
                            <textarea id="address" name="address" class="form-control" rows="3" required><?=$result['address']?></textarea>
                        </div>

                        <div class="row">
                            <div class="col-12 col-md-6">
                                <label for="email" class="form-label">อีเมล</label>
                                <input value="<?=$result['email']?>" id="email" name="email" type="email" class="form-control" required>
                            </div>

                            <div class="col-12 col-md-6">
                                <label for="phone" class="form-label">เบอร์ติดต่อ <span class="text-danger">*</span></label>
                                <input  value="<?=$result['phone']?>" id="phone" name="phone" type="tel" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">


                            <div class="col-12 col-md-10   mt-3">
                                <label for="LINE" class="form-label">LINE <span class="text-danger">*</span></label>
                                <input  value="<?=$result['LINE']?>" id="LINE" name="LINE" type="tel" class="form-control" required>
                            </div>
                        </div>
                </div>
            </div>

        </div>
    </form>
</div>

<!-- footer -->
<?php include('includes/footer.php'); ?>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
