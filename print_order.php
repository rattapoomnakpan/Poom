<?php  
session_start();
// ล้าง session และทำลาย session
unset($_SESSION['intLine']);
unset($_SESSION['strProductID']);
unset($_SESSION['strQty']);
unset($_SESSION['sum_price']);
include('connection/connection.php');

$id = $_SESSION['user_id'];
$sql = sprintf("SELECT * FROM tb_user WHERE id = '%s'", $id);
$query = mysqli_query($connection, $sql);
$result = mysqli_fetch_assoc($query);

// ดึงข้อมูลลงใน tb_order
$sql = "SELECT * FROM tb_order WHERE orderID ='".$_SESSION["order_id"]."'";
$result1 = mysqli_query($connection, $sql);
$query1 = mysqli_fetch_array($result1);
$total = $query1['total_price']; //เก็บราคารวม


if (isset($_FILES['image']['name']) && !empty($_FILES['image']['name'])) {
    $extension = array("jpeg", "jpg", "png");
    $target = $_SERVER['DOCUMENT_ROOT'] . '/upload/user/'; // โฟลเดอร์ที่ต้องการจัดเก็บไฟล์
    $filename = $_FILES['image']['name'];
    $filetmp = $_FILES['image']['tmp_name'];
    $ext = pathinfo($filename, PATHINFO_EXTENSION);
    
    // Sanitize the filename to avoid issues
    $filename = preg_replace('/[^a-zA-Z0-9.-_]/', '_', $filename); // Replace non-ASCII characters
    
    if (in_array($ext, $extension)) {
        $newfilename = time() . $filename;

        // ตรวจสอบว่าโฟลเดอร์ 'upload/user' มีอยู่จริงหรือไม่
        if (!file_exists($target)) {
            mkdir($target, 0777, true); // ถ้าไม่มีก็สร้าง
        }

        // ตรวจสอบว่ามีสิทธิ์การเขียนไฟล์ในโฟลเดอร์หรือไม่
        if (is_writable($target)) {
            if (move_uploaded_file($filetmp, $target . $newfilename)) {
                $filename = $newfilename; // Store the new file name
            } else {
                echo '<script>alert("เพิ่มไฟล์เข้าโฟลเดอร์ไม่สำเร็จ");</script>';
                exit();
            }
        } else {
            echo '<script>alert("โฟลเดอร์ไม่สามารถเขียนไฟล์ได้");</script>';
            exit();
        }
    } else {
        echo '<script>alert("ประเภทไฟล์ไม่ถูกต้อง");</script>';
        exit();
    }
} else {
    $filename = null; 
}


//เปลี่ยนสถานะการโอนเป็น 2 คือการชำระเงินแล้ว
if ($filename) {
    $sql = "UPDATE tb_order SET image = '$filename', order_status = 2 WHERE orderID = '".$_SESSION["order_id"]."'";
    if (mysqli_query($connection, $sql)) {
        echo '<script>alert("เพิ่มข้อมูลสำเร็จ");</script>';
        echo '<script>window.location.href = "m.php";</script>';
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($connection);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<?php include('includes/head.php'); ?>

<style>
    .table {
        margin-left: center;
    }
    .table img {
        width: 100px;
        height: auto;
        object-fit: cover;
    }
</style>

<body>
<?php include('includes/navbar/navbarcart.php'); ?>

<div class="container">
    <form id="form1" method="POST" action="" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-12 mt-5">
                <center>
                    <div class="alert alert-primary h2" role="alert">
                        รายการสั่งซื้อสินค้า
                    </div>
                </center>
                <div style="margin-left:15px;">
                    เลขที่การสั่งซื้อ: <?=$query1['orderID'];?><br>
                    ชื่อ (ลูกค้า) :<span style="color: #b74b4b; font-weight: bold;"> <?=$query1['firstname'];?></span>   นามสกุล  :<span style="color: #b74b4b; font-weight: bold;"> <?=$query1['lastname'];?></span> <br>
                    ที่อยู่การจัดส่ง: <br><?=$query1['address'];?><br>
                    Email: <?=$query1['email'];?><br>
                    เบอร์ติดต่อ: <?=$query1['telephone'];?><br>
                    LINE: <?=$query1['LINE'];?><br>
                </div>
                <table style="text-align:center" class="table table-hover">
                    <thead>
                        <tr>
                            <th>รหัสสินค้า</th>
                            <th>ชื่อสินค้า</th>
                            <th>ราคา</th>
                            <th>จำนวนที่สั่งซื้อ</th>
                            <th>ราคารวม</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $sql2 = "SELECT d.*, p.title, p.price AS orderPrice, d.orderQty, d.Total 
                            FROM order_detail d 
                            LEFT JOIN tb_product p ON d.pro_id = p.id
                            WHERE d.orderID = '".$_SESSION["order_id"]."'";

                    $result2 = mysqli_query($connection, $sql2);
                    if (mysqli_num_rows($result2) > 0) {
                        while ($row = mysqli_fetch_array($result2)) {
                            ?>
                            <tr>
                                <th><?=$row['pro_id']?></th>
                                <th><?=$row['title'];?></th>
                                <th><?=$row['orderPrice']?></th>
                                <th><?=$row['orderQty']?></th>
                                <th><?=$row['Total']?></th>
                            </tr>
                            <?php
                        }
                    } else {
                        echo "ไม่มีข้อมูลการสั่งซื้อ.";
                    }
                    ?>
                    </tbody>
                </table>

                <h4 class="" style="margin-left:820px; margin-top:10px;">รวมเป็นเงิน <span style="color: #b74b4b; font-weight: bold;"><?= number_format($total) ?></span> บาท</h4>
            </div>
        </div>

        <div class="" style="margin-left: 900px;  margin-top:30px;">
            <button onclick="window.print()" style="margin-left: 20px;" type="submit" class="btn btn-success">print</button>
            <button style="margin-left: 20px;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> โอนเงิน</button>
        </div>
    </form>

    <!-- โอนเงิน -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h5 class="modal-title text-main text" id="exampleModalLabel">ธนาคาร&nbsp;&nbsp;<span class="text-theme">(แนบสลิป)</span></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pt-1">
                <center class="my-2">
                    <img style="max-width: 350px; max-height: 350px;" src="https://img5.pic.in.th/file/secure-sv1/slip.png" class="img-fluid" alt="Slip Image">
                </center>
                <div class="d-flex justify-content-center align-items-center mt-1">
                    <p class="text-center m-0 pe-1" style="color: green; font-size: 13px;">ไม่มีค่าธรรมเนียม</p>
                    <div class="topup-fee-green text-center">0%</div>
                </div>
                <div class="row justify-content-center align-items-center mb-2 px-2">
                    <div class="col-12 col-lg-6">
                        <p class="text-theme text-center m-0 mt-2" style="font-size: 13px;">ชื่อบัญชี</p>
                        <h5 class="text-main text-center m-0">นาย รับภูมิ นาคพันธ์</h5>
                    </div>
                    <div class="col-12 col-lg-6">
                        <p class="text-theme text-center m-0 mt-2" style="font-size: 13px;">ธนาคาร</p>
                        <h5 class="text-main text-center m-0">ธนาคารกรุงไทย</h5>
                    </div>
                </div> 
                <center>
                    <div class="col-12 col-lg-6 mb-2 px-2">
                        <p class="text-theme text-center m-0 mt-2" style="font-size: 13px;">เลขบัญชี</p>
                        <h5 class="text-main text-center m-0">000-000-000</h5>
                    </div>
                </center>

                <!-- ฟอร์มอัพโหลดสลิป -->
                <center>
                    <form action="" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label">แนบสลิปรูปภาพ</label>
                            <div class="mb-3">
                                <img width="300" height="300" id="preview" src="#" alt="Preview Image" style="display: none;">
                            </div>
                            <button type="button" onclick="triggerFile();" class="custom-button">เลือกรูปภาพ</button>
                            <input type="file" name="image" id="image" style="display: none;" onchange="previewImage();">
                        </div>
                        <button type="submit" class="btn btn-primary" onclick="window.location.href='product.php';">บันทึก</button>
                    </form>
                </center>
            </div>    
        </div>
    </div>
</div>

</div>

<!-- footer -->
<?php include('includes/footer.php'); ?>

<script>
// ฟังก์ชันสำหรับเปิดการเลือกไฟล์
function triggerFile() {
    document.getElementById('image').click();
}

// ฟังก์ชันสำหรับแสดงตัวอย่างภาพ
function previewImage() {
    const file = document.getElementById('image').files[0];
    const reader = new FileReader();

    reader.onload = function(e) {
        const preview = document.getElementById('preview');
        preview.src = e.target.result;
        preview.style.display = 'block'; // แสดงตัวอย่าง
    };

    if (file) {
        reader.readAsDataURL(file); // อ่านไฟล์เป็น URL
    }
}
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
