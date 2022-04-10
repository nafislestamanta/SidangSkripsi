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
                            <h3>Tambah Data Hama dan Penyakit</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('dashboard'); ?>">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('hamapenyakit'); ?>">Hama dan Penyakit</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Tambah Data Hama dan Penyakit</li>
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
                            <form class="form form-vertical" method="post" action="<?= base_url('hamapenyakit/simpanHP') ?>" enctype="multipart/form-data">
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
                                                <h5>Kategori</h5>
                                                <fieldset class="form-group">
                                                    <select class="form-select form-select-lg" id="kategori" name="kategori">
                                                        <option value="" selected disabled>Pilih Kategori</option>
                                                        <option value="Hama">Hama</option>
                                                        <option value="Penyakit">Penyakit</option>
                                                    </select>
                                                    <?= form_error('kategori', '<large class="text-danger pl-3">', '</large>'); ?>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <h5>Nama</h5>
                                                <input type="text" class="form-control form-control-lg" name="nama" placeholder="Nama" value="<?= set_value('nama'); ?>">
                                                <?= form_error('nama', '<large class="text-danger pl-3">', '</large>'); ?>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <h5>Nama Latin</h5>
                                                <input type="text" class="form-control form-control-lg" name="namaLatin" placeholder="Nama Latin" value="<?= set_value('nama_latin'); ?>">
                                                <?= form_error('namaLatin', '<large class="text-danger pl-3">', '</large>'); ?>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <h5>Upload Gambar</h5>
                                                <input class="form-control form-control-lg" type="file" id="gambar" name="gambar">
                                            </div>
                                        </div>
                                        <div class="col-12 d-flex justify-content-end">
                                            <button type="submit" class="btn btn-success me-1 mb-1">Simpan</button>
                                            <a href="<?= base_url('hamapenyakit'); ?>" class="btn btn-light-secondary me-1 mb-1">Kembali</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
                <!-- // Basic Vertical form layout section end -->

            </div>