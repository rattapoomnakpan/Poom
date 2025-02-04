<?php   
session_start();
include('connection/connection.php');

// ตรวจสอบว่า user_id มีใน session หรือไม่
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// รับ user_id จาก session
$id = $_SESSION['user_id'];

// ดึงข้อมูลของผู้ใช้
$sql_user = sprintf(
    "SELECT * FROM tb_user WHERE id = '%s'",
    mysqli_real_escape_string($connection, $id)
);
$query_user = mysqli_query($connection, $sql_user);

if (!$query_user) {
    die('Error fetching user data: ' . mysqli_error($connection));
}

$user = mysqli_fetch_assoc($query_user);

// ดึงข้อมูลใบสั่งซื้อของผู้ใช้โดยใช้ firstname และ lastname
$sql_orders = sprintf(
    "SELECT * FROM tb_order 
WHERE firstname = '%s' 
AND lastname = '%s' 
AND order_status = '3' 
ORDER BY orderID DESC;
",
    mysqli_real_escape_string($connection, $user['firstname']),
    mysqli_real_escape_string($connection, $user['lastname'])
);
$query_orders = mysqli_query($connection, $sql_orders);

if (!$query_orders) {
    die('Error fetching orders: ' . mysqli_error($connection));
}

// ตรวจสอบว่าได้ส่งข้อมูลภาพมาไหม
if (isset($_FILES['image']['name']) && !empty($_FILES['image']['name']) && isset($_POST['order_id'])) {
    $orderID = $_POST['order_id'];
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

                // เปลี่ยนสถานะการโอนเป็น 2 คือการชำระเงินแล้ว
                $sql = "UPDATE tb_order SET image = '$filename', order_status = 2 WHERE orderID = '$orderID'";
                if (mysqli_query($connection, $sql)) {
                    echo '<script>alert("เพิ่มข้อมูลสำเร็จ");</script>';
                    echo '<script>window.location.href = "my_purchase.php";</script>';
                } else {
                    echo "Error: " . $sql . "<br>" . mysqli_error($connection);
                }
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
}

// เตรียมข้อมูลคำสั่งซื้อ
$query1 = $query_orders;


// ตรวจสอบว่าได้รับการกดปุ่ม "ได้รับสินค้าแล้ว"
if (isset($_POST['received'])) {
    $orderID = $_POST['orderID'];  // รับค่า orderID ที่ส่งมาจากฟอร์ม

    // อัปเดตสถานะ order_status เป็น 5
    $sql = "UPDATE tb_order SET order_status = 5 WHERE orderID = '$orderID'";
    if (mysqli_query($connection, $sql)) {
        echo '<script>alert("สถานะได้รับสินค้าแล้ว");</script>';
        echo '<script>window.location.href = "my_purchase.php";</script>';
    } else {
        echo 'Error updating status: ' . mysqli_error($connection);
    }
}

?>


<!DOCTYPE html>
<html lang="en">
    
<?php include('includes/head.php'); ?>
<style>
    .settings-section{
        font-size: 14px;
    }
</style>
<body>
<?php include('includes/navbar/nabarmy_purchase.php'); ?>


<div class="row g-4 settings-section">
    <center>
        <div class="col-12 col-md-10">
            
            <div class="app-card app-card-settings shadow-sm p-4">
            <style>
                    /* กำหนดสไตล์สำหรับปุ่มทั้งหมดใน <div> */
                div button {
                    padding: 10px;
                    border-radius: 5px;
                    color: white;
                    font-size: 1rem;
                    border: none;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }
                
                /* ปุ่มทั้งหมด */
                .btn-Total {
                   background-color: white;
                    border: 2px solid black; 
                    color: black;
                    
                }

                .btn-Total:hover {
                    background-color: black;
                    color: white;

                }

                /* ปุ่มยกเลิกใบสั่งซื้อ */
                .btn-cancel {
                   background-color: white;
                    border: 2px solid #CC33FF; 
                    color: black;
                    
                }

                .btn-cancel:hover {
                    background-color: #CC33FF;
                    color: white;

                }
                /* ปุ่มชำระเงินแล้ว */
                .btn-payment {
                    background-color: white;
                    border: 2px solid green; 
                    color: black;
                }

                .btn-payment:hover {
                    background-color: green;
                    color: white;
                }

                /* ปุ่มยังไม่ได้ชำระเงิน */
                .btn-unpaid {
                    background-color: white;
                    border: 2px solid red; 
                    color: black;
                }

                .btn-unpaid:hover {
                    background-color: darkred;
                    color: white;
                }

                /* ยืนยันคำสั่งซื้อแล้ว */
                .btn-Already_registered {
                    background-color: white;
                    border: 2px solid blue; 
                    color: black;
                }

                .btn-Already_registered:hover {
                    background-color: blue;
                    color: white;

                }
                
                /* ทำการจัดส่งสำเร็จ */
                .btn-Successfully_sent {
                    background-color: white;
                    border: 2px solid orange; 
                    color: black;
                }

                .btn-Successfully_sent:hover {
                    background-color: orange;
                    color: white;

                }
                /* เสร็จสินการส่งสินค้า*/
                .btn-Finished_product {
                    background-color: white;
                    border: 2px solid black; 
                    color: black;
                }

                .btn-Finished_product:hover {
                    background-color: black;
                    color: white;

                }
                </style>
            <div class="header" >
                <center>
                    <div> 
                        <a href="m.php"style=" margin-left: -90px;">
                            <button class="btn-Total">ทั้งหมด</button>
                        </a>
                        <a href="cancel_order.php" style=" margin-left: 10px;">
                            <button class="btn-cancel">ยกเลิกใบสั่งซื้อ</button>
                        </a>
                        <a href="Not_mony.php" style=" margin-left: 10px;">
                            <button class="btn-unpaid">ยังไม่ได้ชำระเงิน</button>
                        </a>
                        <a href="me_mony.php" style=" margin-left: 10px;">
                            <button class="btn-payment">ชำระเงินแล้ว</button>
                        </a>
                        <a href="Already_registered.php" style=" margin-left: 10px;">
                            <button class="btn-Already_registered">ยืนยันคำสั่งซื้อแล้ว</button>
                        </a>
                        <a href="Successfully_sent.php" style=" margin-left: 10px;">
                            <button class="btn-Successfully_sent">อยู่ระหว่างทำการจัดส่ง</button>
                        </a>
                        <a href="Finished_product.php" style=" margin-left: 10px;">
                            <button class="btn-Finished_product">เสร็จสินการส่งสินค้า</button>
                        </a>
                    </div>
                </center>
            </div>
                <div class="app-card-body mt-5">
                    <table class="table table-hover" id="tableall">
                        <thead>
                            <tr>
                                <th class="text-center">เลขที่ใบสั่งซื้อ</th>
                                <th class="text-center">รูป</th>
                                <th class="text-center">ชื่อ-นามสกุล</th>
                                <th class="text-center">ที่อยู่การจัดส่ง</th>
                                <th class="text-center">เบอร์โทรศัพท์</th>
                                <th class="text-center">ราคารวม</th>
                                <th class="text-center">สถานะ</th>
                                <th class="text-center">วันที่สั่งซื้อ</th>
                                <th class="text-center">Email</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <?php while ($row = mysqli_fetch_array($query1)) { ?>
                                <tr>
                                    <style>
                                        .align-middle{
                                            font-size: 13px;
                                        }
                                    </style>
                                    <td class="align-middle"><?= $row['orderID'] ?></td>
                                    <td class="align-middle">
                                        <img src="/upload/user/<?= $row['image'] ?>" width="100" height="100" class="rounded">
                                    </td>
                                    <td class="align-middle"><?= $row['firstname'] ?> <?= $row['lastname'] ?></td>
                                    <td class="align-middle"><?= $row['address'] ?></td>
                                    <td class="align-middle"><?= $row['telephone'] ?></td>
                                    <td class="align-middle"><?= number_format($row['total_price'], 2) ?></td>
                                    <td class="align-middle">
                                        <?php
                                        if ($row['order_status'] == 0) echo '<div style="background-color: black; color: white; padding: 10px; border-radius: 5px;">ยกเลิก</div>';
                                        elseif ($row['order_status'] == 1) echo '<div style="background-color: red; color: white; padding: 10px; border-radius: 5px;">ยังไม่ได้ชำระเงิน</div>';
                                        elseif ($row['order_status'] == 2) echo '<div style="background-color: green; color: white; padding: 10px; border-radius: 5px;">ชำระเงินแล้ว</div>';
                                        elseif ($row['order_status'] == 3) echo '<div style="background-color: Yellow; color: #000; padding: 10px; border-radius: 5px;">ยืนยันคำสั่งซื้อแล้ว</div>';
                                        elseif ($row['order_status'] == 4) echo '<div style="background-color: white; border: 2px solid orange; color: black; font-weight: bold; padding: 10px 20px; border-radius: 5px; cursor: pointer; border-radius: 5px;">ทำการจัดส่งสำเร็จ </div>';
                                        ?>
                                        
                                    </td>

                                    <td class="align-middle"><?= $row['reg_date'] ?></td>
                                    <td class="align-middle"><?= $row['email'] ?></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </center>
</div>


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
                        <input type="hidden" name="order_id" id="order_id" value="">
                        <button type="submit" class="btn btn-primary">บันทึก</button>
                    </form>
                </center>
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

// ฟังก์ชันแสดงภาพตัวอย่าง
function previewImage() {
    const file = document.getElementById('image').files[0];
    const reader = new FileReader();
    
    reader.onload = function(e) {
        document.getElementById('preview').style.display = 'block';
        document.getElementById('preview').src = e.target.result;
    }
    
    reader.readAsDataURL(file);
}


</script>

</body>
</html>
