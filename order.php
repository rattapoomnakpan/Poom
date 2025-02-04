<?php
ob_start();
session_start();
include 'connection/connection.php';

// ตรวจสอบและกำหนดค่าเริ่มต้นสำหรับ session หากยังไม่ได้กำหนด
if (!isset($_SESSION['strProductID'])) {
    $_SESSION['strProductID'] = array(); // กำหนดเป็นอาร์เรย์ว่าง
}
if (!isset($_SESSION['strQty'])) {
    $_SESSION['strQty'] = array(); // กำหนดเป็นอาร์เรย์ว่าง
}

if (!isset($_SESSION['intLine'])) {
    $_SESSION['intLine'] = 0; // กำหนดค่าเริ่มต้นหากยังไม่ได้กำหนด
}

if (!isset($_SESSION["intLine"])) {  // เช็คว่าแถวเป็นค่าว่างไหม ถ้าว่างให้ทำงานใน {}
    $_SESSION["intLine"] = 0;
    $_SESSION["strProductID"][0] = $_GET["id"];  // รหัสสินค้า
    $_SESSION["strQty"][0] = 1;  // จำนวนสินค้า
    header("location:cart.php");
} else {
    // ตรวจสอบว่า $_SESSION["strProductID"] เป็นอาร์เรย์ก่อนการใช้งาน
    if (is_array($_SESSION["strProductID"])) {
        $key = array_search($_GET["id"], $_SESSION["strProductID"]);
        if ($key !== false) {
            $_SESSION["strQty"][$key] = $_SESSION["strQty"][$key] + 1; // เพิ่มจำนวนสินค้า
        } else {
            $_SESSION["intLine"] = $_SESSION["intLine"] + 1;
            $intNewLine = $_SESSION["intLine"];
            $_SESSION["strProductID"][$intNewLine] = $_GET["id"];
            $_SESSION["strQty"][$intNewLine] = 1;
        }
    } else {
        $_SESSION["strProductID"] = array();  // กำหนดเป็นอาร์เรย์ว่าง
        $_SESSION["strQty"] = array();  // กำหนดเป็นอาร์เรย์ว่าง
    }
    header("location:cart.php");
}
?>
