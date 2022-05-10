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
                    <h3>Edit Data Basis Pengetahuan</h3>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('dashboard'); ?>">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Edit Data Basis Pengetahuan</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Basic Vertical form layout section start -->
        <section class="section">
            <div class="card">
                <div class="card-header">
                    Form Edit Data
                </div>
                <div class="card-body">
                    <form class="form form-vertical" method="post" action="<?= base_url('basispengetahuan/simpanEditBP/' . $edit->kode_pengetahuan) ?>" enctype="multipart/form-data">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>Kode</h5>
                                        <input readonly type="text" class="form-control form-control-lg" name="kode" placeholder="Kode" value="<?= $edit->kode_pengetahuan; ?>">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>Nama Hama/Penyakit</h5>
                                        <fieldset class="form-group">
                                            <select class="form-select form-select-lg" id="nama" name="nama">
                                                <option value="" selected disabled>Pilih Nama Hama/Penyakit</option>
                                                <?php foreach ($tampil as $hp) : ?>
                                                    <option value="<?= $hp->kode_hp ?>" <?php if ($hp->kode_hp == $edit->kode_hp) echo 'selected'; ?>><?= $hp->nama_hp ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <?= form_error('nama', '<large class="text-danger pl-3">', '</large>'); ?>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>Gejala Hama/Penyakit</h5>
                                        <fieldset class="form-group">
                                            <select class="form-select form-select-lg" id="gejala" name="gejala">
                                                <option value="" selected disabled>Pilih Gejala Hama/Penyakit</option>
                                                <?php foreach ($gejala as $gj) : ?>
                                                    <option value="<?= $gj->kode_gejala ?>" <?php if ($gj->kode_gejala == $edit->kode_gejala) echo 'selected'; ?>><?= $gj->nama_gejala ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <?= form_error('gejala', '<large class="text-danger pl-3">', '</large>'); ?>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>MB</h5>
                                        <input type="number" step="any" class="form-control form-control-lg" name="mb" placeholder="Nilai MB" value="<?= $edit->mb ?>">
                                        <?= form_error('mb', '<large class="text-danger pl-3">', '</large>'); ?>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>MD</h5>
                                        <input type="number" step="any" class="form-control form-control-lg" name="md" placeholder="Nilai MD" value="<?= $edit->md ?>">
                                        <?= form_error('md', '<large class="text-danger pl-3">', '</large>'); ?>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <h5>Upload Gambar <small class="text-danger pl-3">Tidak perlu menginput jika tidak ingin mengubah gambar sebelumnya</small></h5>
                                        <input class="form-control form-control-lg" type="file" id="gambar" name="gambar">
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-end">
                                    <button type="submit" class="btn btn-success me-1 mb-1">Simpan</button>
                                    <a href="<?= base_url('basispengetahuan'); ?>" class="btn btn-light-secondary me-1 mb-1">Kembali</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- // Basic Vertical form layout section end -->

    </div>