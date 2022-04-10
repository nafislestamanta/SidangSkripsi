<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $title ?></title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?= base_url('assets/'); ?>css/bootstrap.css">


    <!-- <link rel="stylesheet" href="assets/vendors/jquery-datatables/jquery.dataTables.min.css"> -->
    <link rel="stylesheet" href="<?= base_url('assets/'); ?>vendors/jquery-datatables/jquery.dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="<?= base_url('assets/'); ?>vendors/fontawesome/all.min.css">
    <style>
        table.dataTable td {
            padding: 15px 8px;
        }

        .fontawesome-icons .the-icon svg {
            font-size: 24px;
        }

        .textcolor {
            color: #348337;
        }

        .textcolor:hover {
            color: #29672b;
        }

        .btn-success {
            background-color: #3F9F43;
            border-color: #3F9F43;
            color: #fff
        }

        .btn-check:focus+.btn-success,
        .btn-success:focus,
        .btn-success:hover {
            background-color: #348337;
            border-color: #348337;
            color: #fff
        }

        .btn-primary {
            background-color: #435ebe;
            border-color: #435ebe;
            color: #fff
        }

        .btn-check:focus+.btn-primary,
        .btn-primary:focus,
        .btn-primary:hover {
            background-color: #3950a2;
            border-color: #364b98;
            color: #fff
        }

        .page-item.active .page-link {
            background-color: #3F9F43;
            border-color: #3F9F43;
            color: #fff;
            z-index: 3
        }

        .page-link {
            background-color: #fff;
            border: 1px solid #dee2e6;
            color: #3F9F43;
            display: block;
            position: relative;
            text-decoration: none;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out
        }
    </style>

    <link rel="stylesheet" href="<?= base_url('assets/'); ?>vendors/perfect-scrollbar/perfect-scrollbar.css">

    <link rel="stylesheet" href="<?= base_url('assets/'); ?>vendors/iconly/bold.css">

    <link rel="stylesheet" href="<?= base_url('assets/'); ?>vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="<?= base_url('assets/'); ?>vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="<?= base_url('assets/'); ?>css/app.css">
    <link rel="shortcut icon" href="<?= base_url('assets/'); ?>images/favicon.svg" type="image/x-icon">
</head>

<body style="background-color: #E9FAE6;">