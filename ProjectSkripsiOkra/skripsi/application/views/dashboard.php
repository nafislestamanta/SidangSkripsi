<div id="main">
    <header class="mb-3">
        <a href="#" class="burger-btn d-block d-xl-none">
            <i class="bi bi-justify fs-3"></i>
        </a>
    </header>

    <div class="col-12 col-lg-3">
        <div class="card">
            <div class="card-body py-4 px-6">
                <div class="d-flex align-items-center">
                    <div class="avatar avatar-xl">
                        <img src="assets/images/faces/1.jpg" alt="Face 1">
                    </div>
                    <div class="ms-3 name">
                        <h4 class="text-muted font-semibold">Selamat Datang,</h4>
                        <h3 class="font-extrabold mb-0">Admin</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-content">
        <section class="row">
            <div class="col-12 col-lg-12">
                <div class="row">
                    <div class="col-6 col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-body px-0 py-4">
                                <div class="row">
                                    <div class="col-md-3 py-2">
                                        <div class="stats-icon purple">
                                            <i class="iconly-boldFolder"></i>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <h4 class="text-muted font-semibold">Data Hama dan Penyakit</h4>
                                        <h3 class="font-extrabold mb-0"><?= $hp->total; ?></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-body px-0 py-4">
                                <div class="row">
                                    <div class="col-md-4 py-2">
                                        <div class="stats-icon blue">
                                            <i class="iconly-boldFolder"></i>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <h4 class="text-muted font-semibold">Data Gejala</h4>
                                        <h3 class="font-extrabold mb-0"><?= $gejala->total; ?></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-body px-0 py-4">
                                <div class="row">
                                    <div class="col-md-4 py-2">
                                        <div class="stats-icon green">
                                            <i class="iconly-boldFolder"></i>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <h4 class="text-muted font-semibold">Basis Pengetahuan</h4>
                                        <h3 class="font-extrabold mb-0"><?= $bp->total; ?></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Bar Chart</h4>
            </div>
            <div class="card-body">
                <canvas id="bar"></canvas>
            </div>
        </div>
    </div> -->

    <!-- <section class="section">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Dokumentasi</h5>
                    </div>
                    <div class="card-body">
                        <div class="row gallery" data-bs-toggle="modal" data-bs-target="#galleryModal">
                            <div class="col-6 col-sm-6 col-lg-3 mt-2 mt-md-0 mb-md-0 mb-2">
                                <a href="#">
                                    <img height="240px" class="w-100 active" src="<?= base_url('assets/images/okra/'); ?>fixx.png" data-bs-target="#Gallerycarousel" data-bs-slide-to="0">
                                </a>
                            </div>
                            <div class="col-6 col-sm-6 col-lg-3 mt-2 mt-md-0 mb-md-0 mb-2">
                                <a href="#">
                                    <img height="240px" class="w-100" src="<?= base_url('assets/images/okra/'); ?>penyakit.jpg" data-bs-target="#Gallerycarousel" data-bs-slide-to="1">
                                </a>
                            </div>
                            <div class="col-6 col-sm-6 col-lg-3 mt-2 mt-md-0 mb-md-0 mb-2">
                                <a href="#">
                                    <img height="240px" class="w-100" src="<?= base_url('assets/images/okra/'); ?>penyakit2.jpg" data-bs-target="#Gallerycarousel" data-bs-slide-to="2">
                                </a>
                            </div>
                            <div class="col-6 col-sm-6 col-lg-3 mt-2 mt-md-0 mb-md-0 mb-2">
                                <a href="#">
                                    <img height="240px" class="w-100" src="<?= base_url('assets/images/okra/'); ?>hama3.jpg" data-bs-target="#Gallerycarousel" data-bs-slide-to="3">
                                </a>
                            </div>
                        </div>

                        <div class="row mt-2 mt-md-4 gallery" data-bs-toggle="modal" data-bs-target="#galleryModal">
                            <div class="col-6 col-sm-6 col-lg-3 mt-2 mt-md-0 mb-md-0 mb-2">
                                <a href="#">
                                    <img height="240px" class="w-100 active" src="<?= base_url('assets/images/okra/'); ?>hama5.jpg" data-bs-target="#Gallerycarousel" data-bs-slide-to="0">
                                </a>
                            </div>
                            <div class="col-6 col-sm-6 col-lg-3 mt-2 mt-md-0 mb-md-0 mb-2">
                                <a href="#">
                                    <img height="240px" class="w-100" src="<?= base_url('assets/images/okra/'); ?>2.jpeg" data-bs-target="#Gallerycarousel" data-bs-slide-to="1">
                                </a>
                            </div>
                            <div class="col-6 col-sm-6 col-lg-3 mt-2 mt-md-0 mb-md-0 mb-2">
                                <a href="#">
                                    <img height="240px" class="w-100" src="<?= base_url('assets/images/okra/'); ?>3.jpg" data-bs-target="#Gallerycarousel" data-bs-slide-to="2">
                                </a>
                            </div>
                            <div class="col-6 col-sm-6 col-lg-3 mt-2 mt-md-0 mb-md-0 mb-2">
                                <a href="#">
                                    <img height="240px" class="w-100" src="<?= base_url('assets/images/okra/'); ?>4.jpg" data-bs-target="#Gallerycarousel" data-bs-slide-to="3">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->