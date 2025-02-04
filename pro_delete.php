<?php
session_start();

if (isset($_GET['Line']) && isset($_SESSION["strProductID"][$_GET['Line']])) {
    $line = $_GET['Line'];

    // ลบสินค้าจากเซสชัน
    unset($_SESSION["strProductID"][$line]);
    unset($_SESSION["strQty"][$line]);

    // รีไดเรกต์กลับไปที่หน้าตะกร้า
    header("Location: cart.php");
    exit;
} else {
    // ถ้าไม่มีพารามิเตอร์หรือไม่พบสินค้าที่ต้องการลบ
    echo "ไม่พบสินค้าที่ต้องการลบ";
}
?>
