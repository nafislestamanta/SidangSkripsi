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
                    <h3>Tambah Data Solusi</h3>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('Dashboard'); ?>">Dashboard</a></li>
                            <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('HamaPenyakit'); ?>">Hama dan Penyakit</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Tambah Data Solusi</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Basic Vertical form layout section start -->
        <section class="section">
            <div class="card">
                <div class="card-header">
                    Form Tambah Data
                </div>
                <div class="card-body">
                    <form class="form form-vertical" method="post" action="<?= base_url('Solusi/simpanSolusi') ?>">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>Kode</h5>
                                        <input readonly type="text" class="form-control form-control-lg" name="kode" placeholder="Kode" value="<?= $data; ?>">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>Nama Hama/Penyakit</h5>
                                        <fieldset class="form-group">
                                            <select class="form-select form-select-lg" id="nama" name="nama">
                                                <option value="" selected disabled>Pilih Nama Hama/Penyakit</option>
                                                <?php foreach ($tampil as $hp) : ?>
                                                    <option value="<?= $hp->kode_hp ?>"><?= $hp->nama_hp ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <?= form_error('nama', '<large class="text-danger pl-3">', '</large>'); ?>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>Solusi</h5>
                                        <textarea class="form-control form-control-lg" name="solusi[]" placeholder="Solusi" id=""></textarea>
                                        <?= form_error('solusi', '<large class="text-danger pl-3">', '</large>'); ?>
                                    </div>
                                </div>
                                <div id="solusi">

                                </div>
                                <div class="row">
                                    <div class="col-md-10">
                                        <button type="button" onclick="tambahform()" id="tambah" class="btn btn-success me-1 mb-1">Tambah Form</button>
                                    </div>
                                    <div class="col-2 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-success me-1 mb-1">Simpan</button>
                                        <a href="<?= base_url('Solusi'); ?>" class="btn btn-light-secondary me-1 mb-1">Kembali</a>
                                    </div>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- // Basic Vertical form layout section end -->

        <!-- <script>
            function solusi() {
                var elem = document.querySelector('#solusi');
                var html = elem.innerHTML;
                elem.innerHTML = 'We can dynamically change the HTML. We can even include HTML elements like <a href="#">this link</a>.';
            }
        </script> -->

    </div>