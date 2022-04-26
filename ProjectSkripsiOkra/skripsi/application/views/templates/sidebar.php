<div id="app">
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div style="padding-top: 20px; padding-left: 20px;">
                <a style="font-size: xx-large; font-weight: bold; color: #3F9F43;" href="<?= base_url('dashboard'); ?>"><img width="100px" height="100px" src="<?= base_url('assets/'); ?>images/okra/napisaja.png" alt="Logo" srcset="">Okra-in</a>
            </div>
            <div class="sidebar-menu">
                <ul class="menu">
                    <li class="sidebar-title">Menu</li>
                    <?php if ($title == 'Dashboard') : ?>
                        <li class="sidebar-item active">
                            <a style="background-color: #3F9F43;" href="<?= base_url('Dashboard'); ?>" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                    <?php else : ?>
                        <li class="sidebar-item">
                            <a href="<?= base_url('Dashboard'); ?>" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                    <?php endif; ?>

                    <?php if ($title == 'Data Hama dan Penyakit') : ?>
                        <li class="sidebar-item active has-sub">
                            <a style="background-color: #3F9F43;" href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>Hama dan Penyakit</span>
                            </a>
                            <ul class="submenu active">
                                <li class="submenu-item active">
                                    <a style="color: #3F9F43;" href="<?= base_url('hamapenyakit'); ?>">Data Hama dan Penyakit</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="<?= base_url('gejala'); ?>">Data Gejala</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="<?= base_url('solusi'); ?>">Data Solusi</a>
                                </li>
                            </ul>
                        </li>
                    <?php elseif ($title == 'Data Gejala') : ?>
                        <li class="sidebar-item active  has-sub">
                            <a style="background-color: #3F9F43;" href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>Hama dan Penyakit</span>
                            </a>
                            <ul class="submenu active">
                                <li class="submenu-item ">
                                    <a href="<?= base_url('hamapenyakit'); ?>">Data Hama dan Penyakit</a>
                                </li>
                                <li class="submenu-item active">
                                    <a style="color: #3F9F43;" href="<?= base_url('gejala'); ?>">Data Gejala</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="<?= base_url('solusi'); ?>">Data Solusi</a>
                                </li>
                            </ul>
                        </li>
                    <?php elseif ($title == 'Data Solusi') : ?>
                        <li class="sidebar-item active  has-sub">
                            <a style="background-color: #3F9F43;" href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>Hama dan Penyakit</span>
                            </a>
                            <ul class="submenu active">
                                <li class="submenu-item ">
                                    <a href="<?= base_url('hamapenyakit'); ?>">Data Hama dan Penyakit</a>
                                </li>
                                <li class="submenu-item">
                                    <a href="<?= base_url('gejala'); ?>">Data Gejala</a>
                                </li>
                                <li class="submenu-item active">
                                    <a style="color: #3F9F43;" href="<?= base_url('solusi'); ?>">Data Solusi</a>
                                </li>
                            </ul>
                        </li>
                    <?php else : ?>
                        <li class="sidebar-item has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>Hama dan Penyakit</span>
                            </a>
                            <ul class="submenu">
                                <li class="submenu-item ">
                                    <a href="<?= base_url('hamapenyakit'); ?>">Data Hama dan Penyakit</a>
                                </li>
                                <li class="submenu-item">
                                    <a href="<?= base_url('gejala'); ?>">Data Gejala</a>
                                </li>
                                <li class="submenu-item">
                                    <a href="<?= base_url('solusi'); ?>">Data Solusi</a>
                                </li>
                            </ul>
                        </li>
                    <?php endif; ?>

                    <?php if ($title == 'Data Basis Pengetahuan') : ?>
                        <li class="sidebar-item active">
                            <a style="background-color: #3F9F43;" href="<?= base_url('basispengetahuan'); ?>" class='sidebar-link'>
                                <i class="bi bi-bookmark-fill"></i>
                                <span>Basis Pengetahuan</span>
                            </a>
                        </li>
                    <?php else : ?>
                        <li class="sidebar-item ">
                            <a href="<?= base_url('basispengetahuan'); ?>" class='sidebar-link'>
                                <i class="bi bi-bookmark-fill"></i>
                                <span>Basis Pengetahuan</span>
                            </a>
                        </li>
                    <?php endif; ?>
                </ul>
                <hr>
                <ul class="menu">
                    <li class="sidebar-item">
                        <a style="height: 40px;" href="#" class="w-100 btn btn-danger" data-bs-toggle="modal" data-bs-target="#danger"><b>Logout</b></a>
                    </li>
                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>

    <!--Danger theme Modal -->
    <div class="modal fade text-left" id="danger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel120" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger">
                    <h5 class="modal-title white" id="myModalLabel120">Anda Yakin Keluar?
                    </h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <div class="modal-body">
                    Klik Logout jika anda yakin
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Kembali</span>
                    </button>
                    <a href="<?= base_url('auth/logout'); ?>" class="btn btn-danger ml-1">
                        <i class="bx bx-check d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Logout</span>
                    </a>
                </div>
            </div>
        </div>
    </div>