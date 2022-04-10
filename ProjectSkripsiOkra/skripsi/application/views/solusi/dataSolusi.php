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
                    <h3>Data Solusi</h3>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('dashboard'); ?>">Dashboard</a></li>
                            <li class="breadcrumb-item"><a class="textcolor" href="<?= base_url('hamapenyakit'); ?>">Hama dan Penyakit</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Data Solusi</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Basic Tables start -->
        <section class="section">
            <div class="card">
                <div class="card-header">
                    Tabel Data Solusi
                    <a style="float: right;" href="<?= base_url('solusi/tambahSolusi'); ?>" class="btn btn-success"><i class="fa fa-plus"></i> <b>Tambah Data</b></a>
                </div>
                <div class="card-body">
                    <?= $this->session->flashdata('message'); ?>
                    <table class="table" id="table1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama</th>
                                <th>Kategori</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;
                            foreach ($data as $s) : ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $s->nama_hp; ?></td>
                                    <td><?= $s->kategori; ?></td>
                                    <td>
                                        <a href="<?= base_url('solusi/editSolusi/' . $s->slug); ?>" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
                                        <a href="<?= base_url('solusi/detailSolusi/' . $s->slug); ?>" class="btn btn-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Detail Data"><i class="fa fa-eye"></i> Detail</a>
                                        <a onclick="confirm_modal('<?= base_url('solusi/deleteSolusi/' . $s->slug); ?>')" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#hapus"><i class="fa fa-trash"></i> Hapus</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- Basic Tables end -->
    </div>

    <!--Danger theme Modal -->
    <div class="modal fade text-left" id="hapus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel120" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger">
                    <h5 class="modal-title white" id="myModalLabel120">Apakah Anda yakin mau menghapus Data Solusi?
                    </h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <div class="modal-body">
                    Klik hapus jika anda yakin
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Kembali</span>
                    </button>
                    <a href="" class="btn btn-danger ml-1" id="delete_link">
                        <i class="bx bx-check d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Hapus</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function confirm_modal(delete_url) {
            console.log('delete_url');
            $('#hapus').modal('show', {
                backdrop: 'static'
            });
            document.getElementById('delete_link').setAttribute('href', delete_url);
        }
    </script>