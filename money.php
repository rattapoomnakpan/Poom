<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modal Example</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Modal Background */
.modal-content {
    background-color: #f9f9f9;
    border-radius: 1rem;
    padding: 2rem;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* Modal Header */
.modal-header {
    border-bottom: 1px solid #ddd;
    padding-bottom: 1rem;
}

.modal-title {
    font-size: 1.6rem;
    font-weight: 600;
    color: #333;
}

.text-main {
    color: #2d2d2d;
}

.text-theme {
    color: #b74b4b;
}

.text-theme span {
    font-weight: 600;
}

/* Close Button */
.btn-close {
    background: none;
    border: none;
    font-size: 1.5rem;
    color: #b74b4b;
    cursor: pointer;
}

/* Modal Body */
.modal-body {
    font-size: 14px;
}

.modal-body .my-2 {
    margin-top: 1rem;
}

/* Image Styling */
.modal-body img {
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

/* Text Info Section */
.d-flex {
    gap: 1rem;
    margin-top: 1rem;
}

.topup-fee-green {
    color: green;
    font-size: 16px;
    font-weight: 500;
}

.text-center {
    text-align: center;
}

/* Account Details Section */
.row {
    margin-top: 1.5rem;
}

.row .col-12 {
    padding: 0.5rem;
}

.row .text-theme {
    font-size: 13px;
    color: #b74b4b;
    font-weight: 600;
}

.row .text-main {
    font-size: 14px;
    font-weight: 500;
    color: #333;
}

@media (max-width: 768px) {
    .modal-dialog {
        max-width: 90%;
    }

    .modal-body img {
        max-width: 100%;
        height: auto;
    }

    .topup-fee-green {
        font-size: 14px;
    }

    .modal-header .modal-title {
        font-size: 1.4rem;
    }

    .text-main {
        font-size: 13px;
    }
}

    </style>
</head>
<body>
    <!-- Modal -->
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
                            </center>
                        </div>
                </div>
            </div>
        </div>
    </div>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
       โอนเงิน
    </button>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
