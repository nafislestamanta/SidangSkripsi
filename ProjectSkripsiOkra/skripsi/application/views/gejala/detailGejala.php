<div id="main">
    <header class="mb-3">
        <a href="#" class="burger-btn d-block d-xl-none">
            <i class="bi bi-justify fs-3"></i>
        </a>
    </header>

    <div class="page-heading">
        <div class="page-title">
            <div class="row">
                <div class="col-12 col-md-6 order-md-1 order-last">
                    <h3>Detail Data Gejala</h3>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('Dashboard'); ?>">Dashboard</a></li>
                            <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('HamaPenyakit'); ?>">Hama dan Penyakit</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Detail Data Gejala</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Basic Vertical form layout section start -->
        <section class="section">
            <div class="card">
                <div class="card-header">
                    Tabel Detail Data
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <td style="font-size: large; font-weight: bold; color: black;">Kode Gejala</td>
                                    <td><?= $detail->kode_gejala ?></td>
                                </tr>
                                <tr>
                                    <td style="font-size: large; font-weight: bold; color: black;">Nama</td>
                                    <td><?= $detail->nama_gejala ?></td>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="col-12 d-flex justify-content-end">
                        <a href="<?= base_url('Gejala'); ?>" class="btn btn-light-secondary me-1 mb-1">Kembali</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- // Basic Vertical form layout section end -->

    </div>